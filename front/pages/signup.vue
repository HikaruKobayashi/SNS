<template>
  <v-row>
    <v-col>
      <h2>Sign Up</h2>
      <form>
        <v-text-field v-model="name" :counter="10" label="Name" data-vv-name="name" required />
        <v-text-field v-model="email" :counter="20" label="Email" data-vv-name="email" required />
        <v-text-field
          v-model="password"
          label="password"
          data-vv-name="password"
          required
        />
        <v-text-field
          v-model="passwordConfirm"
          label="passwordConfirm"
          data-vv-name="passwordConfirm"
          required
        />
        <v-btn @click="signup">submit</v-btn>
        <p v-if="error" class="errors">{{error}}</p>
      </form>
    </v-col>
  </v-row>
</template>
<script>
import firebase from "@/plugins/firebase";
export default {
  data() {
    return {
      email: "",
      name: "",
      password: "",
      passwordConfirm: "",
      error: ""
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
          console.log(res.user);
        })
        .catch(error => {
          this.error = (code => {
            switch (code) {
              case "auth/email-already-in-use":
                return "既にそのメールアドレスは使われています";
              case "auth/wrong-password":
                return "※パスワードが正しくありません";
              case "auth/weak-password":
                return "※パスワードは最低6文字以上にしてください";
              default:
                return "※メールアドレスとパスワードをご確認ください";
            }
          })(error.code);
        });
    }
  }
};
</script>