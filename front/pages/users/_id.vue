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
    <v-container>
      <ul>
        <li v-for="post in posts" v-bind:key="post.id">
          <h2>{{user.name}}</h2>
          <p>{{post}}</p>
        </li>
      </ul>
    </v-container>
    <v-container>
      <BlogPost />
    </v-container>
  </div>
</template>

<script>
import axios     from '@/plugins/axios'
import User      from '~/components/User.vue'
import BlogPost      from '~/components/BlogPost.vue'
import ErrorCard from '~/components/ErrorCard.vue'
export default {
  components: {
    User,
    BlogPost,
    ErrorCard
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

<style>
.v-main {
  background-color: rgb(243, 243, 243);
}
#user_id > div > ul {
  overflow-x: auto;
  white-space: nowrap;
  list-style: none;
  padding: 50px;
}
#user_id > div > ul > li {
  color: #ffffff;
  width: 300px;
  height: 350px;
  padding: 1.5rem;
  border-radius: 16px;
  background: linear-gradient(85deg,#434343,#282828);
  display: inline-block;
  transition: .2s;
  overflow: hidden;
  box-shadow: -2rem 0 3rem -2rem #292929;
}
#user_id > div > ul > li:not(:nth-child(1)) {
  margin-left: -130px;
  box-shadow: -3rem 0 3rem -2rem #292929;
}
#user_id > div > ul > li:hover {
  margin-right: 130px;
  transform: translate( -14px,-10px) rotate( 3deg );
}
</style>