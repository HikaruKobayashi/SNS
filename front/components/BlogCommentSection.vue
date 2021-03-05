<template>
  <div id="blog_comment">
    <ul>
      <li>
        <BlogLike :blogId="this.blogId" />
      </li>
      <li>
        <fa class="blog_comment_icon" @click="active" :icon="['far', 'comment']" />
        <p>{{comments.length}}</p>
      </li>
      <li>
        <a :href="this.blogLink"><fa :icon="['fas', 'running']" /></a>
      </li>
    </ul>
    <div v-show="isShow">
      <BlogCommentForm :blogId="blogId"/>
      <div class="blog_comment_container" v-for="comment in comments" :key="comment.id" :comment="comment">
        <ul>
          <li>
            <v-avatar>
              <img
                v-if="!!comment.user.avatar_url"
                size="62"
                :src="comment.user.avatar_url"
              />
              <img
                v-else
                size="62"
                src="@/assets/img/no-setting.png"
              />
            </v-avatar>
          </li>
          <li>
            <p>{{ comment.text }}</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
import BlogLike from '~/components/BlogLike.vue'
import BlogCommentForm from '~/components/BlogCommentForm.vue'

export default {
  component: {
    BlogCommentForm,
    BlogLike
  },
  props: {
    blogId: Number,
    blogLink: String
  },
  data() {
    return {
      comments: {},
      isShow: false
    }
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser; 
    }
  },
  mounted() {
    axios
      .get(`/v1/blogs/${this.blogId}/blog_comments`)
      .then((res) => {
        this.comments = res.data
      })
  },
  methods: {
    active: function () {
      this.isShow = !this.isShow
    }
  }

}
</script>

<style>
#blog_comment > ul, .blog_comment_container > ul {
  padding-left: 0;
  list-style: none;
}
#blog_comment > ul > li {
  padding-right: 5px;
}
#blog_comment > ul > li, .blog_comment_container > ul > li, #blog_comment > ul > li > p {
  display: inline-block;
}
#blog_comment > ul > li > a {
  color: rgb(0, 0, 0);
}
.blog_comment_container > ul {
  padding-bottom: 15px;
}
.blog_comment_icon {
  cursor: pointer;
}
</style>