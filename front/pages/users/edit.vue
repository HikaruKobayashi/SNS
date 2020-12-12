<template>
  <div>
    <v-app>
      <v-btn @click.stop="dialog = true">Edit</v-btn>
      <v-dialog v-model="dialog" max-width="80%">
        <v-card>
          <v-card-title>Edit</v-card-title>
          <v-card-text>
            <v-form>
              <v-text-field
                v-model="name"
                label='Name'
                required
              />
              <v-text-field
                v-model="email"
                label='Email'
                required
              />
              <v-text-field
                v-model="password"
                label='Password'
                required
              />
              <v-text-field
                v-model="passwordConfirm"
                label='Password Confirm'
                required
              />
              <v-row>
                <v-col align="center">
                  <v-btn>
                  Submit
                  </v-btn>
                </v-col>
              </v-row>
            </v-form>
          </v-card-text>
        </v-card>
      </v-dialog>
    </v-app>
  </div>
</template>

<script>
import firebase from '@/plugins/firebase';
import axios from '@/plugins/axios'
export default {
  data() {
    return {
      dialog: false,
      name: '',
      email: '',
      password: '',
      passwordConfirm: '',
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  }
}
</script>