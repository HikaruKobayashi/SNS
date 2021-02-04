<template id="post">
  <div>
    <div class="tweet-btn" @click.stop="dialog = true">
      <fa class="tweet-icon" :icon="['fas', 'feather']" />
    </div>
    <v-dialog v-model="dialog" max-width="80%" class="post_dialog">
      <div class="content">
        <div class="switch_btn" v-on:click="changeShow">
          <fa class="switch_icon" :icon="['fas', 'exchange-alt']" />
        </div>
        <Tweet v-if="show" />
        <Blog  v-if="!show" />
      </div>
    </v-dialog>
  </div>
</template>

<script>
import Tweet from '~/components/Tweet.vue'
import Blog from '~/components/Blog.vue'
export default {
  components: {
    Tweet,
    Blog
  },
  data() {
    return {
      show: true,
      dialog: false,
    }
  },
  methods: {
    changeShow: function(){
      this.show = !this.show;
    }
  }
}
</script>

<style>
.content {
  background-color: rgb(255, 255, 255);
}
</style>