<template>
  <div>
    <v-row>
      <v-col>
        <v-row>
          <span>フォロー</span>
        </v-row>
        <v-row>
          <h3 @click.stop="dialog = true" class="following">{{ followingCount }}</h3>
          <v-dialog v-model="dialog" max-width="80%">
            <div class="following_dialog" v-for="user in following" v-bind:key="user.length">
              <v-avatar class="user-img">
                <img
                  size="62"
                  src="@/assets/img/no-setting.png"
                />
              </v-avatar>
              <h3>{{user.name}}</h3>
            </div>
          </v-dialog>
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
    },
    following: {
      type: Array,
      required: true,
    }
  },
  data() {
    return {
      dialog: false
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

<style>
.following {
  cursor: pointer;
}
.following_dialog {
  background-color: rgb(255, 255, 255);
}
</style>