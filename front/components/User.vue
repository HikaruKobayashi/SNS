<template id="user">
  <v-card>
    <ul id="user_info">
      <li>
        <v-avatar class="user-img">
          <img
            v-if="!!image"
            size="62"
            :src="image"
          />
          <img
            v-else
            size="62"
            src="@/assets/img/no-setting.png"
          />
        </v-avatar>
        <v-card-title>{{ user.name }}</v-card-title>
      </li>
      <li>
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
      </li>
    </ul>
  </v-card>
</template>

<script>
import axios from '@/plugins/axios'
import Relationship from './Relationship.vue'
import Edit         from '~/components/Edit.vue'
export default {
  components: {
    Relationship,
    Edit,
  },
  props: {
    user: {
      type: Object,
      required: true
    }
  },
  data () {
    return {
      image: '',
    }
  },
  mounted () {
    axios
      .get(`/v1/tweets/${this.$route.params.id}`)
      .then((res) => {
        this.image = res.data.avatar_url
      })
  },
}
</script>

<style>
#user {
  background-color: #e0e0e0 !important;
}
#user_info {
  list-style: none;
}
#user_info > li:first-child > div {
  display: inline-block;
}
</style>