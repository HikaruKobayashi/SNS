<template>
  <v-card>
    <v-row>
      <h3>{{ user.name }}</h3>
    </v-row>
    <Relationship
      v-if="Object.keys(user).length"
      :followerCount="user.follower_count"
      :followingCount="user.following_count"
      @addFollower="user.follower_count++"
      @subFollower="user.follower_count--"
    />
  </v-card>
</template>

<script>
import Relationship from './Relationship.vue'
export default {
  components: {
    Relationship
  },
  props: {
    user: {
      type: Object,
      required: true
    }
  }
}
</script>