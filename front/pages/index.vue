<template>
  <section>
    <div v-if="user">
      <div class="switch_btn" v-on:click="changeShow">
        <fa class="switch_icon" :icon="['fas', 'exchange-alt']" />
      </div>
      <BlogHomePost v-if="show" />
      <TweetHomePost v-else />
    </div>
    <div v-else>
      <lp />
    </div>
  </section>
</template>

<script>
import axios from '@/plugins/axios'
import TweetHomePost from '~/components/TweetHomePost.vue'
import BlogHomePost from '~/components/BlogHomePost.vue'
import lp from '~/components/lp.vue'

export default {
  components: {
    TweetHomePost,
    BlogHomePost,
    lp
  },
  data() {
    return {
      show: true,
    }
  },
  computed: {
    user() {
      return this.$store.state.currentUser; 
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
.switch_btn {
  width: 50px;
  height: 50px;
  line-height: 55px;
  text-align: center;
  border-radius: 50%;
  cursor: pointer;
  background-color: rgb(255, 255, 255);
}
.switch_icon {
  font-size: 25px;
}
</style>