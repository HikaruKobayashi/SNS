<template>
  <div>
    <ErrorCard
      :display="userNotFound"
      title="404"
      message="ユーザーが存在しません。"
    />
    <v-container v-if="!userNotFound">
      <v-row>
        <v-col>
          <User :user="user" />
        </v-col>
      </v-row>
    </v-container>
    <v-container>
      <div v-for="post in posts" v-bind:key="post.id">
        <v-card>
          <v-container class="mb-10">
            <p>{{user.name}}</p>
            <v-divider></v-divider>
            <p>{{post}}</p>
          </v-container>
        </v-card>
      </div>
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
      tweets: {},    
      posts: {},
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
        this.user = response.data
      })
      .catch((error) => {
        if (error.response.status === 404) {
          this.userNotFound = true
        }
        console.log(error)
      })
    axios
      .get(`/v1/tweets/${this.$route.params.id}`)
      .then((res) => {
        this.tweets = res.data
        const post = new Array();
        for( let i = 0; i < this.tweets.tweets.length; i++ ) {
          this.tweets.tweets[i].content
          post.unshift(this.tweets.tweets[i].content)
        }
        this.posts = post
      })
  },
}
</script>