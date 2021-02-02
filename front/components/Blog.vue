<template>
  <v-form>
    <v-card>
      <v-row>
        <v-col align="center">
          <v-file-input
            class="col-10 mt-8"
            @change="onFileChange"
            accept="image/png, image/jpeg, image/bmp, image/gif, image/heic"
            required
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
export default {
  data() {
    return {
      dialog: false,
      blog: {},
      uploadedImage: ''
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    onFileChange() {
      let file = event.target.files[0] || event.dataTransfer.files
      let reader = new FileReader()
      reader.onload = () => {
        this.uploadedImage = event.target.result
        this.blog.image = this.uploadedImage
      }
      reader.readAsDataURL(file)
    },
    createBlogPost() {
      axios
        .post('/v1/blogs', {
          blog: this.blog,
          current_user_id: this.currentUser.user.id
        })
        .then((res) => {
          // this.$router.push(`/users/${this.$route.params.id}`)
          this.blog = {}
          this.uploadedImage = ''
          // this.dialog = false
        })
    }
  }
}
</script>