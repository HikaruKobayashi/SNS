<template>
  <div id="tweet_post">
    <ul>
      <li v-for="tweet in tweets" v-bind:key="tweet.id">
        <p>{{tweet.content}}</p>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  data() {
    return {
      tweets: {},    
    }
  },
  computed: {
    user() {
      return this.$store.state.currentUser; 
    },
    paramsUserId () {
      return this.$route.params.id
    }
  },
  mounted () {
    axios
      .get(`/v1/tweets/${this.$route.params.id}`)
      .then((res) => {
        const tweet = new Array();
        for( let i = 0; i < res.data.tweets.length; i++ ) {
          tweet.unshift(res.data.tweets[i])
        }
        this.tweets = tweet
        console.log(this.tweets)
      })
  }
}
</script>

<style>
#tweet_post {
  width: 100%;
}
#tweet_post > ul {
  overflow-x: auto;
  white-space: nowrap;
  list-style: none;
  padding: 50px;
}
#tweet_post > ul > li {
  width: 300px;
  height: 350px;
  padding: 1.5rem;
  border-radius: 16px;
  display: inline-block;
  transition: .2s;
  overflow: hidden;
  background-color: rgb(255, 255, 255);
  box-shadow: -2rem 0 3rem -2rem #292929;
}
#tweet_post > ul > li:not(:nth-child(1)) {
  margin-left: -130px;
  box-shadow: -3rem 0 3rem -2rem #292929;
}
#tweet_post > ul > li:hover {
  margin-right: 130px;
  transform: translate( -14px,-10px) rotate( 3deg );
}
</style>