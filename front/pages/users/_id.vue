<template>
  <div id="user_id">
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
    <v-container v-if="blogs.length > 0 && tweets.length > 0">
      <div class="switch_btn" v-on:click="changeShow">
        <fa class="switch_icon" :icon="['fas', 'exchange-alt']" />
      </div>
      <BlogPost v-if="show" />
      <TweetPost v-else />
    </v-container>
    <v-container v-else-if="tweets.length > 0">
      <TweetPost />
    </v-container>
    <v-container v-else-if="blogs.length > 0">
      <BlogPost />
    </v-container>
  </div>
</template>

<script>
import axios     from '@/plugins/axios'
import User      from '~/components/User.vue'
import BlogPost      from '~/components/BlogPost.vue'
import TweetPost      from '~/components/TweetPost.vue'
import ErrorCard from '~/components/ErrorCard.vue'
export default {
  components: {
    User,
    BlogPost,
    TweetPost,
    ErrorCard
  },
  data () {
    return {
      user: {},
      blogs: {},
      tweets: {},
      show: true,
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
      .get(`/v1/blogs/${this.$route.params.id}`)
      .then((res) => {
        const blog = new Array();
        for( let i = 0; i < res.data.blogs.length; i++ ) {
          blog.unshift(res.data.blogs[i])
        }
        this.blogs = blog
      })
    axios
      .get(`/v1/tweets/${this.$route.params.id}`)
      .then((res) => {
        const tweet = new Array();
        for( let i = 0; i < res.data.tweets.length; i++ ) {
          tweet.unshift(res.data.tweets[i])
        }
        this.tweets = tweet
      })
  },
  methods: {
    changeShow: function(){
      this.show = !this.show;
    }
  }
}
</script>

<style>
.v-main {
  background-color: rgb(243, 243, 243);
}
.switch_btn {
  width: 50px;
  height: 50px;
  line-height: 55px;
  text-align: center;
  border-radius: 50%;
  cursor: pointer;
  background-color: rgb(255, 255, 255);
}
.switch_icon {
  font-size: 25px;
}
</style>