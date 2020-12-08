<template>
  <v-app id="app">
    <v-container>
      <v-row>
        <v-col>
          <div>
            <v-btn @click.stop="dialog = true">tweet</v-btn>
            <v-dialog v-model="dialog" max-width="60%">
              <v-card>
                <Tweet />
              </v-card>
            </v-dialog>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
import Tweet from '~/pages/tweets/tweets.vue'
export default {
  components: {
    Tweet,
  },
  data() {
    return {
      dialog: false,
    }
  },
}
</script>