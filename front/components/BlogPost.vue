<template>
  <div id="blog_post">
    <ul>
      <li v-for="blog in blogs" v-bind:key="blog.id">
        <h2>{{ blog.title }}</h2>
        <img
          :src="blog.image"
        />
      </li>
    </ul>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  data() {
    return {
      blogs: {}
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
      .get(`/v1/blogs/${this.$route.params.id}`)
      .then((res) => {
        const blog = new Array();
        for( let i = 0; i < res.data.blogs.length; i++ ) {
          blog.unshift(res.data.blogs[i])
        }
        this.blogs = blog
        console.log(this.blogs)
      })
  },
}
</script>

<style>
#blog_post > ul {
  list-style: none;
}
#blog_post > ul > li {
  display: inline-block;
}
#blog_post > ul > li > img {
  width: 300px;
  height: auto;
}
</style>