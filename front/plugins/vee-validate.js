import Vue from 'vue'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'
import { required, max, email } from 'vee-validate/dist/rules'

extend('required', required)
extend('email', email)
extend('max', max)

Vue.component('ValidationProvider', ValidationProvider)
Vue.component('ValidationOcserver', ValidationObserver)