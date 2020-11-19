<template>
<div>
  <ErrorCard
    :display="userNotFound"
    title="404 not find"
    message="ユーザーが存在しません。"
  />
  <v-container v-if="!userNotFound">
    <v-row>
      <v-col>
        <User :user="user" />
      </v-col>
    </v-row>
  </v-container>
</div>
</template>

<script>
import axios     from '@/plugins/axios'
import User      from '~/components/User.vue'
import ErrorCard from '~/components/ErrorCard.vue'
export default {
  components: {
    User
  },
  data () {
    return {
      user: {},
      userNotFound: false,
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.user
    },
    paramsUserId () {
      return this.$route.params.id
    }
  },
  mounted () {
    axios
      .get(`/v1/users/${this.$route.params.id}`)
      .then((response) => {
        // const data = JSON.parse(response.data.user)
        // this.user = user
        this.user = response.data
      })
      .catch((error) => {
        if (error.response.status === 404) {
          this.userNotFound = true
        }
        console.log(error)
      })
},
}
</script>