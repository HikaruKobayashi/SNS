<template>
  <div>
    <v-row>
      <v-col>
        <v-row>
          <span>フォロー</span>
        </v-row>
        <v-row>
          <h3>{{ followingCount }}</h3>
        </v-row>
      </v-col>
      <v-col>
        <v-row>
          <span>フォロワー</span>
        </v-row>
        <v-row>
          <h3>{{ followerCount }}</h3>
        </v-row>
      </v-col>
      <v-col v-if="currentUser && Number(paramsUserId) !== currentUser.id">
        <FollowButton
          :userId="Number(paramsUserId)"
          @addFollower="$emit('addFollower')"
          @subFollower="$emit('subFollower')"
        />
      </v-col>
    </v-row>
  </div>
</template>

<script>
import FollowButton from './Follow.vue'
export default {
  components: {
    FollowButton
  },
  props: {
    followingCount: {
      type: Number,
      required: true,
      default: 0
    },
    followerCount: {
      type: Number,
      required: true,
      default: 0
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    },
    paramsUserId () {
      return this.$route.params.id
    }
  }
}
</script>