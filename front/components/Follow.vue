<template>
  <div v-if="currentUser">
    <v-skeleton-loader
      v-if="loading"
      type="button"
    />
    <v-btn
      small
      id="follow_btn"
      @click="follow"
      v-if="!followed && !loading && !iconOnly"
      :disabled="disabled"
    >
      <span style="margin-bottom: 2px">フォローする</span>
    </v-btn>
    <v-btn
      small
      id="following_btn"
      @click="unfollow"
      :disabled="disabled"
      v-if="followed && !loading && !iconOnly"
    >
      <span style="margin-bottom: 2px">フォロー中</span>
    </v-btn>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  props: {
    userId: {
      type: Number,
      required: true,
    },
    iconOnly: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      followed: false,
      disabled: false,
      loading: false
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    follow () {
      if (this.disabled) { return }
      this.disabled = true
      axios
        .post(`/v1/users/${this.userId}/follow`, {
          current_user_id: this.currentUser.user.id
        })
        .then((res) => {
          this.$store.commit('addFollowing', res.data)
          this.followed = true
          this.$emit('addFollower')
        })
      setTimeout(() => {
        this.disabled = false
      }, 200)
    },
    unfollow () {
      if (this.disabled) { return }
      this.disabled = true
      axios
        .delete(`/v1/users/${this.userId}/unfollow`, {
          params: { current_user_id: this.currentUser.user.id }
        })
        .then((res) => {
          this.$store.commit('removeFollowing', res.data)
          this.followed = false
          this.$emit('subFollower')
        })
      setTimeout(() => {
        this.disabled = false
      }, 200)
    }
  },
  mounted () {
    this.loading = true
    this.disabled = true
    setTimeout(() => {
      if (this.currentUser) {
        const following = this.currentUser.following
        const followed = following.some((f) => {
          return this.userId === f
        })
        if (followed) { this.followed = true }
      }
      this.loading = false
      this.disabled = false
    }, 2000)
  }
}
</script>