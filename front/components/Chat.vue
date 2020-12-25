<template>
  <div class="chat-btn">
    <v-btn @click.stop="dialog = true">Message</v-btn>
    <v-dialog v-model="dialog" max-width="80%">
      <v-card>
        <h2>Message</h2>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dialog: false,
    }
  }
}
</script>

<style>
.chat-btn {
  position: fixed;
  right: 14px;
  bottom: 14px;
}
</style>