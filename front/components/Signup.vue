<template>
  <div>
    <div class="signup_btn" @click.stop="dialog = true">アカウント作成</div>
    <v-dialog v-model="dialog" max-width="60%">
      <div class="signup_form">
        <h2>Sign Up</h2>
        <form>
          <v-text-field v-model="name" :counter="10" label="Name" data-vv-name="name" required />
          <v-text-field v-model="email" :counter="20" label="Email" data-vv-name="email" required />
          <v-text-field
            v-model="password"
            label="password"
            data-vv-name="password"
            required
            :type="show1 ? 'text' : 'password'"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="show1 = !show1"
          />
          <v-text-field
            v-model="passwordConfirm"
            label="passwordConfirm"
            data-vv-name="passwordConfirm"
            required
            :type="show2 ? 'text' : 'password'"
            :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="show2 = !show2"
          />
          <div align="right">
            <v-btn @click="signup">submit</v-btn>
          </div>
          <p v-if="error" class="errors">{{error}}</p>
        </form>
      </div>
    </v-dialog>
  </div>
</template>

<script>
import axios from "@/plugins/axios"
import firebase from "@/plugins/firebase";
export default {
  data() {
    return {
      email: "",
      name: "",
      password: "",
      passwordConfirm: "",
      show1: false,
      show2: false,
      error: "",
      dialog: false,
    };
  },
  methods: {
   signup() {
      if (this.password !== this.passwordConfirm) {
        this.error = "※パスワードとパスワード確認が一致していません";
      }
      firebase
        .auth()
          .createUserWithEmailAndPassword(this.email, this.password)
            .then(res => {
                const user = {
                  email: res.user.email,
                  name: this.name,
                  uid: res.user.uid
                };
                axios.post("/v1/users",{ user }).then(() => {
                  this.$router.push("/");
                });
            })
    }
  }
};
</script>

<style>
.signup_btn {
  color: #f3f3f3;
  width: 300px;
  padding: 10px 60px;
  margin: 10px auto;
  cursor: pointer;
  border-radius: 50px;
  background: linear-gradient(rgb(52,62,98), rgb(24,26,41));
}
.signup_form {
  padding: 30px;
  background-color: #f3f3f3;
}
</style>
