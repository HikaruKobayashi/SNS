<template>
  <div>
    <h3 @click.stop="dialog = true" class="followed">{{ followerCount }}</h3>
    <v-dialog v-model="dialog" max-width="60%">
      <div class="followed_dialog" v-for="user in followed_user" v-bind:key="user.length">
        <v-avatar>
          <img
            v-if="!!user.avatar_url"
            size="62"
            :src="user.avatar_url"
          />
          <img
            v-else
            class="user-img"
            size="62"
            src="@/assets/img/no-setting.png"
          />
        </v-avatar>
        <a :href="'/users/'+user.id">{{ user.name }}</a>
        <FollowButton
          class="follow_btn"
          :userId="user.id"
        />
      </div>
    </v-dialog>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
import FollowButton from './Follow.vue'

export default {
  components: {
    FollowButton,
  },
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
  display: flex;
  align-items: center;
  padding: 5px 100px;
  background-color: rgb(255, 255, 255);
}
.followed_dialog > a {
  text-decoration: none;
  color: rgb(0, 0, 0);
  margin: 0 0 0 10px;
}
.follow_btn {
  margin-left: auto;
}
</style>