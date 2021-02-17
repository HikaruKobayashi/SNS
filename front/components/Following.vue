<template>
  <div>
    <h3 @click.stop="dialog = true" class="following">{{followingCount}}</h3>
    <v-dialog v-model="dialog" max-width="80%">
      <div class="following_dialog" v-for="user in following_user" v-bind:key="user.length">
        <h3>{{user.name}}</h3>
      </div>
    </v-dialog>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  data() {
    return {
      dialog: false,
      following_user: [],
    }
  },
  props: {
    followingCount: {
      type: Number,
      required: true,
      default: 0
    },
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    },
    paramsUserId () {
      return this.$route.params.id
    }
  },
  mounted () {
    axios
      .get(`/v1/users/${this.$route.params.id}/following`)
      .then((res) => {
        this.following_user = res.data
      })
  },
}
</script>

<style>
.following {
  cursor: pointer;
}
.following_dialog {
  background-color: rgb(255, 255, 255);
}
</style>