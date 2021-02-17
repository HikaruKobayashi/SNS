<template>
  <div>
    <h3 @click.stop="dialog = true" class="followed">{{ followerCount }}</h3>
    <v-dialog v-model="dialog" max-width="80%">
      <div class="followed_dialog" v-for="user in followed_user" v-bind:key="user.length">
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
      followed_user: [],
    }
  },
  props: {
    followerCount: {
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
      .get(`/v1/users/${this.$route.params.id}/followers`)
      .then((res) => {
        this.followed_user = res.data
      })
  },
}
</script>

<style>
.followed {
  cursor: pointer;
}
.followed_dialog {
  background-color: rgb(255, 255, 255);
}
</style>