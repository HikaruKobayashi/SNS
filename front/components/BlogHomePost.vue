<template>
  <div id="blog_home_post">
    <ul>
      <li v-for="blog in blogs" v-bind:key="blog.id" data-aos="fade-up">
        <img :src="blog.image">
        <div>
          <v-avatar>
            <img
              v-if="!!blog.user.avatar_url"
              size="62"
              :src="blog.user.avatar_url"
            />
            <img
              v-else
              class="user-img"
              size="62"
              src="@/assets/img/no-setting.png"
            />
          </v-avatar>
          <a :href="'/users/'+blog.user_id">{{ blog.user.name }}</a>
        </div>
        <div>
          <p>{{ blog.title }}</p>
        </div>
        <BlogCommentSection :blogId="blog.id" :blogLink="blog.link" />
      </li>
    </ul>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
import BlogCommentSection from '~/components/BlogCommentSection.vue'

export default {
  component: {
    BlogCommentSection,
  },
  data() {
    return {
      blogs: {},
      blogId: ''
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
        this.blogs = res.data
      })
  },
}
</script>

<style>
#blog_home_post {
  width: 100%;
}
#blog_home_post > ul {
  width: 100%;
  list-style: none;
  padding: 0;
}
#blog_home_post > ul > li {
  width: 50%;
  background-color: rgb(255, 255, 255);
  border: 1px solid rgb(250, 250, 250);
  box-shadow: 1.5rem 2.5rem 2rem -2rem hsl(200 50% 20% / 40%);
  border-radius: 10px;
  margin: 0 auto 30px auto;
  overflow: hidden;
}
#blog_home_post > ul > li > img {
  width: 100%;
}
#blog_home_post > ul > li > div {
  padding: 15px;
}
#blog_home_post > ul > li > div:nth-child(2) {
  display: flex;
  align-items: center;
}
#blog_home_post > ul > li > div:nth-child(2) > a {
  text-decoration: none;
  color: rgb(0, 0, 0);
  margin: 0 0 0 10px;
}
/* Responsive */
@media (max-width: 800px) {
  #blog_home_post > ul > li {
    width: 90%;
  }
}
</style>