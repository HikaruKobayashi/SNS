<template>
  <section>
    <div v-if="user">
      <div class="switch_btn">
        <fa class="switch_icon" :icon="['fas', 'exchange-alt']" v-on:click="changeShow" />
      </div>
      <BlogHomePost v-if="show" />
      <TweetHomePost v-else />
    </div>
    <div v-else>
      <Logo />
    </div>
  </section>
</template>

<script>
import axios from '@/plugins/axios'
import TweetHomePost from '~/components/TweetHomePost.vue'
import BlogHomePost from '~/components/BlogHomePost.vue'

export default {
  components: {
    TweetHomePost,
    BlogHomePost
  },
  data() {
    return {
      show: true,
    }
  },
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
  },
  methods: {
    changeShow: function(){
      this.show = !this.show;
    }
  }
}
</script>

<style>
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