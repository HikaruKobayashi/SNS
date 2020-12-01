<template>
  <v-container>
    <v-row>
      <v-col cols="4" offset="4">
        <v-card>
          <v-card-title class="info white--text subheading" primary-title>
            <span class="title">{{ error.statusCode }}</span>
          </v-card-title>
          <v-card-text class="display-1 ma-7 text-center" v-if="error.statusCode === 404">
            ページが見つかりません
          </v-card-text>
          <v-card-actions>
            <v-btn text to="/">Home</v-btn>            
          </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>
 
<script>
export default {
  props: ['error'],
}
</script>