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
      <div class="switch_btn" v-on:click="changeShow">
        <fa class="switch_icon" :icon="['fas', 'exchange-alt']" />
      </div>
      <BlogPost v-if="show" />
      <TweetPost v-else />
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