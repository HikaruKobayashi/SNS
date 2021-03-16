<template>
  <v-form>
    <v-card>
      <v-row>
        <v-col align="center">
          <TweetTextField
            v-model="content"
            label="What's happening?"
            rules="max:300|required"
          />
        </v-col>
      </v-row>
      <v-row>
        <v-col align="right">
          <v-btn
            class="mr-3"
            @click="createTweet"
          >
          tweet
          </v-btn>
        </v-col>
      </v-row>
    </v-card>
  </v-form>
</template>

<script>
import axios from '@/plugins/axios'
import TweetTextField from './TweetTextField.vue'
export default {
  components: {
    TweetTextField
  }, 
  data() {
    return {
      dialog: false,
      content: '',
      error: ''
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    createTweet () {
      axios
        .post('/v1/tweets', {
          content: this.content,
          current_user_id: this.currentUser.user.id
        })
        .then((res) => {
          this.content = ''
          this.$emit('dialogFalse')
        })
    }
  }
}
</script>

<style>
.tweet-btn {
  width: 50px;
  height: 50px;
  line-height: 55px;
  text-align: center;
  border-radius: 50%;
  cursor: pointer;
  background-color: rgb(255, 255, 255);
}
.tweet-icon {
  font-size: 25px;
}
.error {
  color: rgb(255, 0, 0);
}
</style>