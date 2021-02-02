<template>
  <v-form>
    <v-card>
      <v-row>
        <v-col align="center">
          <croppa
            v-model="myCroppa"
            :width="400"
            :height="200"
            :accept="'image/*'"
          />
          <v-text-field
            class="col-10 mt-8"
            v-model="blog.title"
            required
          />
        </v-col>
      </v-row>
      <v-row>
        <v-col align="right">
          <v-btn
            class="mr-3"
            @click="createBlogPost"
          >
          Post
          </v-btn>
        </v-col>
      </v-row>
    </v-card>
  </v-form>
</template>

<script>
import axios from '@/plugins/axios'
import croppa from '@/plugins/croppa'
export default {
  data() {
    return {
      dialog: false,
      blog: {},
      myCroppa: {},
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    createBlogPost() {
      this.blog.image = this.myCroppa.generateDataUrl()
      axios
        .post('/v1/blogs', {
          blog: (this.blog),
          current_user_id: this.currentUser.user.id
        })
        .then((res) => {
          this.blog = {}
        })
    }
  }
}
</script>