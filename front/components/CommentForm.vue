<template>
  <v-form>
    <v-row>
      <v-col align="center">
        <v-text-field
          v-model="text"
          placeholder="comment"
        />
      </v-col>
    </v-row>
    <v-row>
      <v-col align="right">
        <v-btn
          class="mr-3"
          @click="createComment"
        >
        Comment
        </v-btn>
      </v-col>
    </v-row>
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
      text: '',
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
          text: this.text,
          tweet_id: this.tweetId
        })
        .then((res) => {
          this.$router.push('/')
          this.text = ''
        })
    }
  }
}
</script>