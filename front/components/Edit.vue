<template>
  <div v-if="currentUser && Number(paramsUserId) == currentUser.user.id">
    <v-btn
      small
      class="ma-2"
      @click.stop="dialog = true"
      :disabled="disabled"
    >
      ユーザー情報を編集
    </v-btn>
    <v-dialog v-model="dialog" max-width="80%">
      <v-card>
        <v-card-title>Edit Profile</v-card-title>
        <v-card-text>
          <v-row>
            <v-avatar 
              v-if="uploadImageUrl"
              size="62"
            >
            <img 
              :src="uploadImageUrl"
            />
            </v-avatar>
            <v-avatar
              v-else
              size="62"
            >
            <img
              src="@/assets/img/no-setting.png"
            />
            </v-avatar>
          </v-row>
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
        </v-card-text>
        <v-card-text>
          <v-form>
            <v-text-field
              v-model="name"
              label='Name'
              required
            />
            <v-text-field
              v-model="email"
              label='Email'
              required
            />
            <v-text-field
              v-model="password"
              label='New Password'
              required
            />
            <v-text-field
              v-model="passwordConfirm"
              label='New Password Confirm'
              required
            />
            <v-row>
              <v-col align="center">
                <v-btn>
                Submit
                </v-btn>
              </v-col>
            </v-row>
          </v-form>
        </v-card-text>
      </v-card>
    </v-dialog>
    <Logout/>
  </div>
</template>

<script>
import firebase from '@/plugins/firebase';
import axios    from '@/plugins/axios'
import Logout   from '~/components/Logout.vue'

export default {
  components: {
    Logout,
  },
  data() {
    return {
      dialog: false,
      name: '',
      email: '',
      password: '',
      passwordConfirm: '',
      disabled: false,
      image: '',
      uploadImageUrl: ''
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    },
    paramsUserId () {
      return this.$route.params.id
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
  mounted (){
    const setDefaultData = () => {
      axios
        .get(`/v1/users/${this.$route.params.id}/edit`)
        .then((res) => {
          this.name = res.data.name
          this.email = res.data.email
        })
    }
    if (this.currentUser) {
      setDefaultData()
    } else {
      setTimeout(setDefaultData, 1000)
    }
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
           this.uploadImageUrl = fr.result
        })
      } else {
        this.uploadImageUrl = ''
      }
    },
    createImage(){
      const formData = new FormData()
      formData.append('image', this.image)
      const config = {
        headers: {
          'content-type': 'multipart/form-data'
        }
      }
      axios
        .patch(`/v1/users/${this.currentUser.user.id}/update_image`, formData, config)
        .then((response) => {
          this.image = response.data.image
          this.$store.commit('setUserAvatarUrl', response.data.image)
      })
    },
  }
}
</script>