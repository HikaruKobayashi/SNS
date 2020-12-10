<template>
  <div>
    <v-btn @click.stop="dialog = true">tweet</v-btn>
    <v-dialog v-model="dialog" max-width="80%">
      <v-form>
        <v-card>
          <v-row>
            <v-col>
              <v-icon @click="dialog = false">mdi-close</v-icon>
            </v-col>
          </v-row>
          <v-row>
            <v-col align="center">
              <v-divider></v-divider>
              <v-textarea
                class="col-10 mt-8"
                solo
                v-model="content"
                placeholder="What's happening?"
                required
              />
              <v-divider></v-divider>
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
    </v-dialog>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  data() {
    return {
      dialog: false,
      content: '',
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
          this.$router.push('/home')
        })
    }
  }
}
</script>