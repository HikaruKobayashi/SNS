import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export const state = () => ({
 currentUser: {},
 loggedIn: false,
})


export const mutations = {
 setUser(state, payload) {
   state.currentUser = payload
 },
 setLoggedIn(state, payload) {
   state.loggedIn = payload
 },
}

export const actions = {

}