<template>
  <section>
    <div v-if="user" class="user_container">
      <div class="user_info">
        <Post />
        <div class="switch_btn" v-on:click="changeShow">
          <fa class="switch_icon" :icon="['fas', 'exchange-alt']" />
        </div>
      </div>
      <BlogHomePost v-if="show" />
      <TweetHomePost v-else />
    </div>
    <div v-else>
      <LP />
    </div>
  </section>
</template>

<script>
import Post from '~/components/Post.vue'
import TweetHomePost from '~/components/TweetHomePost.vue'
import BlogHomePost from '~/components/BlogHomePost.vue'
import LP from '~/components/LP.vue'

export default {
  components: {
    TweetHomePost,
    BlogHomePost,
    LP,
    Post
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
  methods: {
    changeShow: function(){
      this.show = !this.show;
    }
  }
}
</script>

<style>
.user_container {
  position: relative;
}
.user_info {
  width: 200px;
  display: flex;
}
.switch_btn {
  width: 50px;
  height: 50px;
  margin-left: 20px;
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