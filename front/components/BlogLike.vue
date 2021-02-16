<template>
  <div id="blog_like">
    <fa class="blog_like_btn" v-if="!liked" @click="like" :icon="['fas', 'heart']" />
    <fa class="blog_liked_btn" v-else @click="unlike" :icon="['fas', 'heart']" />
    <p>{{count}}</p>
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
      .get(`/v1/blogs/${this.blogId}/blog_likes`)
      .then((res) => {
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
        .post('/v1/blog_likes', {
          current_user_id: this.currentUser.user.id,
          blog_id: this.blogId
        })
        .then((res) => {
          this.liked = true
          this.like_id = res.data.id
        })
    },
    unlike () {
      axios
        .delete(`/v1/blogs/${this.blogId}/blog_likes/${this.like_id}`, {
          current_user_id: this.currentUser.user.id,
          blog_id: this.blogId
        })
        .then((res) => {
          this.liked = false
        })
    }
  }
}
</script>

<style>
.blog_like_btn, .blog_liked_btn {
  cursor: pointer;
}
.blog_liked_btn {
  color: rgb(255, 0, 0);
}
</style>