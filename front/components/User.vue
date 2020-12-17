<template>
  <v-card>
    <v-card-title>{{ user.name }}</v-card-title>
    <v-card-text>
      <Relationship
        v-if="Object.keys(user).length"
        :followerCount="user.follower_count"
        :followingCount="user.following_count"
        @addFollower="user.follower_count++"
        @subFollower="user.follower_count--"
      />
      <Logout/>
    </v-card-text>
  </v-card>
</template>

<script>
import Relationship from './Relationship.vue'
import Logout from '~/components/Logout.vue'
export default {
  components: {
    Relationship,
    Logout
  },
  props: {
    user: {
      type: Object,
      required: true
    }
  }
}
</script>