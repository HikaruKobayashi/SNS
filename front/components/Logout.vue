<template>
  <v-btn
    v-if="currentUser && Number(paramsUserId) == currentUser.user.id"
    small
    class="ma-2"
    @click="logOut"
    :disabled="disabled"
  >
    <span>ログアウト</span>
  </v-btn>
</template>

<script>
import firebase from "@/plugins/firebase";
export default {
  data () {
    return {
      disabled: false,
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
  methods: {
    logOut() {
      firebase
        .auth()
        .signOut()
        .then(() => {
          this.$store.commit("setUser", null);
          this.$router.push("/login");
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
};
</script>