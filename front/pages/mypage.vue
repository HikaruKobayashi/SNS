<template>
  <div>
    <div v-if="user">
      <p>ユーザー名: {{user.name}}</p>
      <p>Email: {{user.email}}</p>
      <v-btn @click="logOut">ログアウト</v-btn>
    </div>
  </div>
</template>

<script>
import firebase from "@/plugins/firebase";
export default {
  computed: {
    user() {
      return this.$store.state.currentUser;
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