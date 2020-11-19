import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const state = () => ({
  currentUser: {
    id: '',
    name: '',
    email: '',
    following: [],
  },
  loggedIn: false,
})


export const mutations = {
  setUser(state, payload) {
    state.currentUser = payload
  },
  setLoggedIn(state, payload) {
   state.loggedIn = payload
  },
  setFollowing (state, payload) {
    state.currentUser.following = payload.map((p) => {
      return p.id
    })
  },
  addFollowing (state, payload) {
    console.log(state.currentUser);
    state.currentUser.following.unshift(payload)
  },
  removeFollowing (state, payload) {
    state.currentUser.following = state.currentUser.following.filter((l) => {
      return l !== payload
    })
  },
}

export const actions = {}