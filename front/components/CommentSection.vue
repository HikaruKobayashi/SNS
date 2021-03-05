<template>
  <div id="comment">
    <ul>
      <li>
        <TweetLike :tweetId="this.tweetId" />
      </li>
      <li>
        <fa class="comment_icon" @click="active" :icon="['far', 'comment']" />
        <p>{{comments.length}}</p>
      </li>
    </ul>
    <div v-show="isShow">
      <CommentForm :tweetId="tweetId"/>
      <div class="comment_container" v-for="comment in comments" :key="comment.id" :comment="comment">
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
import TweetLike from '~/components/TweetLike.vue'
import CommentForm from '~/components/CommentForm.vue'

export default {
  component: {
    CommentForm,
    TweetLike
  },
  props: {
    tweetId: Number
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
      .get(`/v1/tweets/${this.tweetId}/comments`)
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
#comment > ul, .comment_container > ul {
  padding-left: 0;
  list-style: none;
}
#comment > ul > li {
  padding-right: 5px;
}
#comment > ul > li, .comment_container > ul > li, #comment > ul > li > p {
  display: inline-block;
}
.comment_container > ul {
  padding-bottom: 15px;
}
.comment_icon {
  cursor: pointer;
}
</style>