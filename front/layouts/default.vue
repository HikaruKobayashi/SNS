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
    <v-bottom-navigation v-if="user" v-show="$vuetify.breakpoint.xs" app>
      <v-btn v-for="menu in menus" :key="menu.title" :to="menu.url">
        <v-icon>{{ menu.icon }}</v-icon>
      </v-btn>
    </v-bottom-navigation>
  </v-app>
</template>

<script>
export default {
  data () {
    return {
      menus: [
        { title: 'Index', icon: 'mdi-web', url: '/' },
        { title: 'Home', icon: 'mdi-home', url: '/home' },
        { title: 'Mypage', icon: 'mdi-account', url: `/users/4` },
      ]
    }
  },
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