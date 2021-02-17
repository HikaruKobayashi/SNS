<template>
  <div>
    <v-row>
      <v-col>
        <v-row>
          <span>フォロー</span>
        </v-row>
        <v-row>
          <Following :followingCount="this.followingCount" />
        </v-row>
      </v-col>
      <v-col>
        <v-row>
          <span>フォロワー</span>
        </v-row>
        <v-row>
          <Followed :followerCount="this.followerCount"/>
        </v-row>
      </v-col>
    </v-row>
    <v-row>
      <v-col v-if="currentUser && Number(paramsUserId) !== currentUser.user.id">
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
import Following from './Following.vue'
import Followed from './Followed.vue'
export default {
  components: {
    FollowButton,
    Following,
    Followed
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
    },
  },
  data() {
    return {
      dialog: false,
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    },
    paramsUserId () {
      return this.$route.params.id
    }
  },
}
</script>