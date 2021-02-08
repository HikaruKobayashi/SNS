<template>
  <div>
    <v-avatar class="user-img">
      <img
        v-if="!!image"
        size="62"
        :src="image"
      />
      <img
        v-else
        size="62"
        src="@/assets/img/no-setting.png"
      />
    </v-avatar>
    <v-file-input
        v-model="inputValue"
        accept="image/png, image/jpeg, image/bmp, image/gif, image/heic"
        @change="setImage"
      />
    <v-btn
      @click="createImage"
    >
      Change
    </v-btn>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  data () {
    return {
      image: '',
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    },
    inputValue: {
      get() {
        return this.value;
      },
      set(value) {
        this.$emit("input", value);
      }
    }
  },
  mounted () {
    axios
      .get(`/v1/tweets/${this.$route.params.id}`)
      .then((res) => {
        this.user = res.data
        this.image = res.data.avatar_url
      })
  },
  methods:{
    setImage(file){
      if (file !== undefined && file !== null) {
        if (file.name.lastIndexOf('.') <= 0) {
          return
        }
        const fr = new FileReader()
        fr.readAsDataURL(file)
        fr.addEventListener('load', () => {
           this.image = fr.result
        })
      } else {
        this.image = ''
      }
    },
    createImage() {
      return new Promise((resolve, _) => {
        axios({
          url: `/v1/users/${this.currentUser.user.id}/update_image`,
          data: {
            image: this.image
          },
          method: 'PATCH'
        }).then(res => {
          this.image = res.data.avatar_url
          this.$store.commit('setUserAvatarUrl', res.data.avatar_url)
          resolve(res)
        }).catch(e => {
          console.log(e)
        })
      })
    }
  }
}
</script>

<style>
  .user-img {
    border: 1px solid rgba(0, 0, 0, 0.8);
  }
</style>