<template>
  <ul id="tweet_like">
    <li>
      <fa class="tweet_like_btn" v-if="!liked" @click="like" :icon="['fas', 'heart']" />
      <fa class="tweet_liked_btn" v-else @click="unlike" :icon="['fas', 'heart']" />
    </li>
    <li>{{count}}</li>
  </ul>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  props: {
    tweetId: Number
  },
  data() {
    return {
      liked: false,
      like_id: 0,
      count: 0
    }
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser; 
    }
  },
  mounted() {
    axios
      .get(`/v1/tweets/${this.tweetId}/tweet_likes`)
      .then((res) => {
        this.count = res.data.length
        if (res.data.length != 0) {
          this.liked = true

          const like = new Array();
          for ( let i = 0; i < res.data.length; i ++) {
            like.unshift(res.data[i].id)
          }
          this.like_id = like
        }
      })
  },
  methods: {
    like () {
      axios
        .post('/v1/tweet_likes', {
          current_user_id: this.currentUser.user.id,
          tweet_id: this.tweetId
        })
        .then((res) => {
          this.liked = true
          this.count ++;
          this.like_id = res.data.id
        })
    },
    unlike () {
      axios
        .delete(`/v1/tweets/${this.tweetId}/tweet_likes/${this.like_id}`, {
          current_user_id: this.currentUser.user.id,
          tweet_id: this.tweetId
        })
        .then((res) => {
          this.count --;
          this.liked = false
        })
    }
  }
}
</script>

<style>
#tweet_like {
  list-style: none;
}
#tweet_like > li {
  display: inline-block;
}
.tweet_like_btn, .tweet_liked_btn {
  cursor: pointer;
}
.tweet_liked_btn {
  color: rgb(255, 0, 0);
}
</style>