<template>
  <v-container>
    <v-row>
      <v-col>
        <v-card>
          <v-card-title>Tweet</v-card-title>
          <v-card-text>
            <v-form>
              <Tweet />
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import Tweet from '~/pages/tweets/tweets.vue'
export default {
  components: {
    Tweet,
  },
}
</script>
<style>
</style>