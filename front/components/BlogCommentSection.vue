<template>
  <div id="blog_comment">
    <ul>
      <li>
        <fa class="blog_comment_icon" @click="active" :icon="['far', 'comment']" />
      </li>
      <li>
        <p>{{comments.length}}</p>
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
import BlogCommentForm from '~/components/BlogCommentForm.vue'

export default {
  component: {
    BlogCommentForm,
  },
  props: {
    blogId: Number
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
  list-style: none;
}
#blog_comment > ul > li, .blog_comment_container > ul > li {
  display: inline-block;
}
.blog_comment_container > ul {
  padding-bottom: 15px;
}
.blog_comment_icon {
  cursor: pointer;
}
</style>