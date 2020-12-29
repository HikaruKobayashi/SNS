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
import ActionCable from 'actioncable';
export default {
  data() {
    return {
      dialog: false,
      message: "",
    }
  },
  created() {
    const cable = ActionCable.createConsumer('ws://localhost:3000/cable')

    this.messageChannel = cable.subscriptions.create("PostChannnel", {
      received: (data) => {
        this.$store.commit("addMessage", data);
      },
    })
  },
  methods: {
    handleClick: function() {
      this.messageChannel.perform('post', {
        message: this.message,
      });
      this.message = ""
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