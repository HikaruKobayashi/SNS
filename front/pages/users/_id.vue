<template>
<div>
  <v-container >
    <v-row>
      <v-col>
        <h2>Hello!{{user.name}}</h2>
      </v-col>
    </v-row>
  </v-container>
</div>
</template>

<script>
import axios from '@/plugins/axios'
import User from '~/components/User.vue'
export default {
  components: {
    User
  },
  data () {
    return {
      user: {},
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
        console.log(response.data)
        // const data = JSON.parse(response.data.user)
        this.user = response.data
      })
  },
}
</script>