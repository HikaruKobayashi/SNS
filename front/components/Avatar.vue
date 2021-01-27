<template>
  <v-avatar class="user-img">
    <img
      v-if="!!image"
      :src="image"
    />
    <img
      v-else
      src="@/assets/img/no-setting.png"
    />
  </v-avatar>
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
    }
  },
  mounted () {
    axios
      .get(`/v1/users/${this.$route.params.id}`)
      .then((response) => {
        this.user = response.data
        const userAvatar = this.user.image
        console.log(this.user);
        console.log(userAvatar);
      })
  }
}
</script>

<style>
  .user-img {
    border: 1px solid rgba(0, 0, 0, 0.8);
  }
</style>