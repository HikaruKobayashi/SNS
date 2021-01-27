<template id="user">
  <v-card>
    <div>
      <!-- <Avatar /> -->
      <v-card-title>{{ user.name }}</v-card-title>
    </div>
    <v-card-text>
      <Relationship
        v-if="Object.keys(user).length"
        :followerCount="user.follower_count"
        :followingCount="user.following_count"
        @addFollower="user.follower_count++"
        @subFollower="user.follower_count--"
      />
      <Edit />
    </v-card-text>
  </v-card>
</template>

<script>
import Relationship from './Relationship.vue'
import Edit         from '~/components/Edit.vue'
// import Avatar       from '~/components/Avatar.vue'
export default {
  components: {
    Relationship,
    Edit,
    // Avatar
  },
  props: {
    user: {
      type: Object,
      required: true
    }
  }
}
</script>

<style>
#user {
  background-color: #e0e0e0 !important;
}
</style>