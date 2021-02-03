<template>
  <div id="blog_post">
    <ul>
      <li v-for="blog in blogs" v-bind:key="blog.id">
        <img
          :src="blog.image"
        />
        <p>{{ blog.title }}</p>
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
      })
  },
}
</script>

<style>
#blog_post {
  width: 100%;
}
#blog_post > ul {
  overflow-x: auto;
  white-space: nowrap;
  list-style: none;
  padding: 50px;
}
#blog_post > ul > li {
  width: 300px;
  height: 350px;
  border-radius: 16px;
  display: inline-block;
  transition: .2s;
  box-shadow: -2rem 0 3rem -2rem #292929;
  background-color: rgb(255, 255, 255);
  box-shadow: 1.5rem 2.5rem 2rem -2rem hsl(200 50% 20% / 40%);
  overflow: hidden;
  cursor: pointer;
}
#blog_post > ul > li:not(:nth-child(1)) {
  margin-left: -130px;
  box-shadow: -3rem 0 3rem -2rem #292929;
}
#blog_post > ul > li:hover {
  margin-right: 130px;
  transform: translate( -14px,-10px) rotate( 3deg );
}
#blog_post > ul > li > img {
  width: 100%;
}
</style>