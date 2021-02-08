<template>
  <div id="tweet_home_post">
    <div v-for="user in users" v-bind:key="user.id">
      <v-card data-aos='fade-up'>
        <div class="tweet_user">
          <v-avatar class="user-img">
            <img
              v-if="!!user.user.avatar_url"
              size="62"
              :src="user.user.avatar_url"
            />
            <img
              v-else
              size="62"
              src="@/assets/img/no-setting.png"
            />
          </v-avatar>
          <a :href="'/users/'+user.user_id">{{ user.user.name }}</a>
        </div>
        <div class="tweet_home_content">
          <p>{{user.content}}</p>
        </div>
        <CommentSection :tweetId="user.id"/>
      </v-card>
    </div>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
import CommentSection from '~/components/CommentSection.vue'

export default {
  component: {
    CommentSection,
  },
  data() {
    return {
      users: {},
      tweetId: ''
    }
  },
  computed: {
    currentUser() {
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

<style>
#tweet_home_post {
  width: 100%;
}
#tweet_home_post > div {
  width: 50%;
  margin: 0 auto 30px auto;
}
.tweet_home_content {
  padding: 15px;
}
.tweet_user {
  display: flex;
  align-items: center;
  padding: 15px;
}
.tweet_user > a {
  text-decoration: none;
  color: rgb(0, 0, 0);
  margin: 0 0 0 10px;
}
/* Responsive */
@media (max-width: 800px) {
  #tweet_home_post > div {
    width: 90%;
  }
}
</style>