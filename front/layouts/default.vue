<template>
  <v-app>
    <header>
      <v-app-bar app>
        <h2>SNS</h2>
        <v-spacer></v-spacer>
        <Tweet />
      </v-app-bar>
    </header>
    <v-main>
      <v-container>
        <nuxt />
      </v-container>
    </v-main>
    <v-bottom-navigation v-show="$vuetify.breakpoint.xs" app>
      <v-btn v-for="menu in menus" :key="menu.title" :to="menu.url">
        <v-icon>{{ menu.icon }}</v-icon>
      </v-btn>
    </v-bottom-navigation>
  </v-app>
</template>

<script>
import axios from '@/plugins/axios'
import Tweet from '~/components/Tweet.vue'
export default {
  components: {
    Tweet
  },
  data () {
    return {
      user: {},
      menus: [
        { title: 'Index', icon: 'mdi-web', url: '/' },
        { title: 'Home', icon: 'mdi-home', url: '/home' },
        { title: 'Mypage', icon: 'mdi-account', url: `/users/4` },
      ]
    }
  },
}
</script>