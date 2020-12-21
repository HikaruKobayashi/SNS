<template>
  <div v-if="currentUser && Number(paramsUserId) == currentUser.user.id">
    <v-btn
      small
      class="ma-2"
      @click.stop="dialog = true"
      :disabled="disabled"
    >
      ユーザー情報を編集
    </v-btn>
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
    <Logout/>
  </div>
</template>

<script>
import firebase from '@/plugins/firebase';
import axios from '@/plugins/axios'
import Logout from '~/components/Logout.vue'
export default {
  components: {
    Logout
  },
  data() {
    return {
      dialog: false,
      name: '',
      email: '',
      password: '',
      passwordConfirm: '',
      disabled: false,
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    },
    paramsUserId () {
      return this.$route.params.id
    }
  },
  mounted (){
    const setDefaultData = () => {
      axios
        .get(`/v1/users/${this.$route.params.id}/edit`)
        .then((res) => {
          this.name = res.data.name
          this.email = res.data.email
        })
    }
    if (this.currentUser) {
      setDefaultData()
    } else {
      setTimeout(setDefaultData, 1000)
    }
  }
}
</script>