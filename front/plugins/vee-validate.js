import Vue from 'vue'
import { ValidationProvider, ValidationObserver, extend } from 'vee-validate'

import * as originalRules from 'vee-validate/dist/rules';
for (let rule in originalRules) {
  extend(rule, {
    ...originalRules[rule],
  });
}

Vue.component('ValidationProvider', ValidationProvider)
Vue.component('ValidationOcserver', ValidationObserver)