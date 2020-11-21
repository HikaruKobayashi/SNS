import firebase from "@/plugins/firebase"
import axios from "@/plugins/axios"

export const setUserParameter = (user, store) => {
  async function setUser (user, store) {
    if (user) {
      const { data } = await axios.get(`/v1/users?uid=${user.uid}`)
      const userParams = data
      console.log("ログインしているユーザー:", data.user.name)
      const following = data.following
      store.commit('setUser', userParams)
      store.commit('setLoggedIn',true)
      store.commit('setFollowing', following)
    } else {
      store.commit('setUser', null)
      store.commit('setLoggedIn',false)
      store.commit('setFollowing', null)
    }
  }
 setUser(user, store)
}

const authCheck = ({ store, redirect }) => {
  firebase.auth().onAuthStateChanged(async user => {
    await setUserParameter(user, store)
  })
}

export default authCheck