<template>
  <div>
    <v-container>
      <v-card>
        <v-card-title>
          <h1>{{ error.statusCode }}</h1>
        </v-card-title>
        <v-card-text v-if="error.statusCode === 404">
          <p>ページが見つかりません。</p>
        </v-card-text>
      </v-card>
    </v-container>
  </div>
</template>
 
<script>
export default {
  props: ['error'],
}
</script>