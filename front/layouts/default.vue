<template>
  <v-app>
    <header v-if="user">
      <v-app-bar>
        <h2 class='app-title'><a href="/">SNS</a></h2>
        <v-spacer></v-spacer>
      </v-app-bar>
    </header>
    <v-main>
      <v-container v-if="user">
        <nuxt />
      </v-container>
      <nuxt v-else />
    </v-main>
  </v-app>
</template>

<script>
export default {
  computed: {
    user() {
      return this.$store.state.currentUser; 
    }
  },
}
</script>

<style>
.v-main {
  background-color: rgb(243, 243, 243);
  padding: 0!important;
}
.app-title > a {
  color: rgb(0, 0, 0);
  text-decoration: none;
}
</style>