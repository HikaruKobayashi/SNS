<template>
  <div id="blog_like">
    <fa class="blog_like_btn" v-if="!liked" @click="like" :icon="['fas', 'heart']" />
    <fa class="blog_liked_btn" v-else @click="unlike" :icon="['fas', 'heart']" />
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  props: {
    blogId: Number
  },
  data() {
    return {
      liked: false
    }
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser; 
    }
  },
  methods: {
    like () {
      axios
        .post('/v1/blog_likes', {
          current_user_id: this.currentUser.user.id,
          blog_id: this.blogId
        })
        .then((res) => {
          this.liked = true
        })
    },
    unlike () {
      // axios
      //   .delete(`/v1/blogs/${this.blogId}/blog_likes`, {
      //     current_user_id: this.currentUser.user.id,
      //     blog_id: this.blogId
      //   })
      //   .then((res) => {
      //     this.liked = false
      //   })
    }
  }
}
</script>

<style>
.blog_like_btn {
  cursor: pointer;
}
.blog_liked_btn {
  color: rgb(255, 0, 0);
}
</style>