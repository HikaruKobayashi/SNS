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
          @click="createBlogComment"
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
    blogId: Number
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
    createBlogComment () {
      axios
        .post('/v1/blog_comments', {
          current_user_id: this.currentUser.user.id,
          text: this.text,
          blog_id: this.blogId
        })
        .then((res) => {
          this.$router.push('/')
          this.text = ''
        })
    }
  }
}
</script>