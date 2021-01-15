<template>
  <v-container>
    <div v-for="post in posts" v-bind:key="post.id">
      <v-card data-aos='fade-up'>
        <v-container class="mb-10">
          <p>{{post}}</p>
        </v-container>
      </v-card>
    </div>
  </v-container>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  data () {
    return {
      tweets: {},    
      posts: {},
    }
  },
  mounted () {
    axios
      .get('/v1/tweets/')
      .then((res) => {
        console.log(res.data[0].user.name)
        this.tweets = res.data
        const post = new Array();
        for( let i = 0; i < this.tweets.length; i++ ) {
          this.tweets[i].content
          post.push(this.tweets[i].content)
        }
        this.posts = post
      })
  }
}
</script>