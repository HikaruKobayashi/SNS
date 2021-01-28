<template>
  <v-form>
    <v-card>
      <v-row>
        <v-col>
          <v-icon @click="dialog = false">mdi-close</v-icon>
        </v-col>
      </v-row>
      <v-row>
        <v-col align="center">
          <v-divider></v-divider>
          <v-text-field
            class="col-10 mt-8"
            required
          />
        </v-col>
      </v-row>
      <v-row>
        <v-col align="right">
          <v-btn
            class="mr-3"
          >
          Post
          </v-btn>
        </v-col>
      </v-row>
    </v-card>
  </v-form>
</template>

<script>
import axios from '@/plugins/axios'
export default {
  data() {
    return {
      dialog: false,
    }
  },
}
</script>