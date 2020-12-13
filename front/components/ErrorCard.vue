<template>
  <v-card
    v-if="display"
  >
    <v-card-title>
      <h1>{{ title }}</h1>
    </v-card-title>
    <v-card-text>
      <p>{{ message }}</p>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  props: {
    display: {
      type: Boolean,
      required: true
    },
    title: {
      type: String,
      required: true
    },
    message: {
      type: String,
      required: true
    }
  }
}
</script>