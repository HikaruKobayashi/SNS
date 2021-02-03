<template>
  <div class="container">
    <div v-if="user">
      <div v-for="user in users" v-bind:key="user.id">
        <v-card data-aos='fade-up'>
          <v-container class="mb-10">
            <p>{{user.username}}</p>
            <v-divider></v-divider>
            <p>{{user.content}}</p>
          </v-container>
        </v-card>
      </div>
    </div>
    <div v-else>
      <Logo />
    </div>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  computed: {
    user() {
      return this.$store.state.currentUser; 
    }
  },
  mounted () {
    axios
      .get('/v1/tweets/')
      .then((res) => {
        this.users = res.data
        const user = new Array();
        for( let i = 0; i < res.data.length; i++ ) {
          this.users[i].content
          user.push(this.users[i])
        }
        this.users = user
      })
  }
}
</script>