<template>
  <div>
    <p v-for="comment in comments" :key="comment.id" :comment="comment">{{ comment.text }}</p>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  props: {
    tweetId: Number
  },
  data() {
    return {
      comments: {},
    }
  },
  mounted() {
    axios
      .get(`/v1/tweets/${this.tweetId}/comments`)
      .then((res) => {
        this.comments = res.data
      })
  }
}
</script>