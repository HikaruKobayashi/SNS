<template>
  <v-form>
    <v-text-field
      v-model="comment"
      placeholder="comment"
    />
    <v-btn
      class="mr-3"
      @click="createComment"
    >
    Send
    </v-btn>
  </v-form>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  props: {
    tweetId: Number
  },
  data() {
    return {
      users: {},
      comment: '',
    }
  },
  computed: {
    currentUser() {
      return this.$store.state.currentUser; 
    }
  },
  methods: {
    createComment () {
      axios
        .post('/v1/comments', {
          current_user_id: this.currentUser.user.id,
          comment: this.comment,
          tweet_id: this.tweetId
        })
        .then((res) => {
          this.$router.push('/')
          this.comment = ''
        })
    }
  }
}
</script>