<template>
  <div id="blog_post">
    <ul>
      <li v-for="blog in blogs" v-bind:key="blog.id" data-aos="fade-up">
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
      .get('/v1/blogs/')
      .then((res) => {
        console.log(res.data)
        this.blogs = res.data
        console.log(this.blogs)
      })
  },
}
</script>

<style>
#blog_post {
  width: 100%;
}
#blog_post > ul {
  display: flex;
  flex-wrap: wrap;
	justify-content: space-between;
  list-style: none;
  padding: 0;
}
#blog_post > ul > li {
  width: 32%;
  background-color: rgb(255, 255, 255);
  border: 1px solid rgb(250, 250, 250);
  box-shadow: 1.5rem 2.5rem 2rem -2rem hsl(200 50% 20% / 40%);
  border-radius: 10px;
  margin-bottom: 30px;
  overflow: hidden;
  cursor: pointer;
}
#blog_post > ul > li:hover {
  border: 1px solid rgb(253, 253, 253);
  box-shadow: 0 1px 4px rgba(0,0,0,.2);
  transform: translateY(3px);
}
#blog_post > ul > li > img {
  width: 100%;
}
</style>