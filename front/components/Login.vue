<template>
  <div>
    <div class="login_btn" @click.stop="dialog = true">ログイン</div>
    <v-dialog v-model="dialog" max-width="60%">
      <div class="login_form">
        <h2>Login</h2>
        <form>
          <v-text-field
            v-model="email"
            :counter="20"
            label="email"
            data-vv-name="email"
            required
          />
          <v-text-field
            v-model="password"
            label="password"
            data-vv-name="password"
            required
            :type="show1 ? 'text' : 'password'"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            @click:append="show1 = !show1"
          />
          <div align="right">
            <v-btn @click="login">submit</v-btn>
          </div>
          <p v-if="error" class="errors">{{error}}</p>
        </form>
      </div>
    </v-dialog>
  </div>
</template>
<script>
import firebase from "@/plugins/firebase";
export default {
  data() {
    return {
      email: "",
      password: "",
      show1: false,
      error: "",
      dialog: false,
    };
  },
  methods: {
    login() {
      firebase
        .auth()
        .signInWithEmailAndPassword(this.email, this.password)
        .then(() => {
          this.$router.push("/");
        })
        .catch(error => {
          console.log(error);
          this.error = (code => {
            switch (code) {
              case "auth/user-not-found":
                return "メールアドレスが間違っています";
              case "auth/wrong-password":
                return "※パスワードが正しくありません";
              default:
                return "※メールアドレスとパスワードをご確認ください";
            }
          })(error.code);
        });
    }
  }
};
</script>

<style>
.errors {
  color: red;
  margin-top: 20px;
}
.login_btn {
  color: #f3f3f3;
  width: 300px;
  padding: 10px 60px;
  margin: 10px auto;
  cursor: pointer;
  border-radius: 50px;
  background: linear-gradient(rgb(52,62,98), rgb(24,26,41));
}
.login_form {
  padding: 30px;
  background-color: #f3f3f3;
}
</style>
