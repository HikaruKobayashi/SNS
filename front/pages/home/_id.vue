<template>
  <v-container>
    <div v-for="post in posts" v-bind:key="post.id">
      <v-card>
        <p>{{post}}</p>
      </v-card>
    </div>
  </v-container>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  data () {
    return {
      user: {}, 
      tweets: {},    
      posts: {},
    }
  },
  mounted () {
    axios
      .get(`/v1/tweets/${this.$route.params.id}`)
      .then((res) => {
        this.user = res.data.user
        this.tweets = res.data
        const post = new Array();
        for( let i = 0; i < this.tweets.tweets.length; i++ ) {
          this.tweets.tweets[i].content
          post.push(this.tweets.tweets[i].content)
        }
        this.posts = post
      })
  }
}
</script>