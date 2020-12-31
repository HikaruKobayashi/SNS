<template>
  <v-app>
    <header>
      <v-app-bar color='#6FB7FF'>
        <h2 class='app-title'>SNS</h2>
        <v-spacer></v-spacer>
        <Tweet v-show="$vuetify.breakpoint.xs" />
      </v-app-bar>
    </header>
    <v-main>
      <Tweet class='tweet' v-show="$vuetify.breakpoint.lg" />
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
    Tweet,
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

<style>
.app-title {
  color: #ffffff;
}

.tweet {
  position: fixed;
	top: 50%;
	left: 5%;
	transform: translate(-50%, -50%);
}

.v-main{
  background: linear-gradient(-45deg, #87AFFE,#B7E0FE) fixed;
}
</style>