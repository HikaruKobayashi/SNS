import Vue from 'vue';
import ActionCableVue from 'actioncable-vue';

if (process.client) {
  Vue.use(ActionCableVue, {
    debug: true,
    debugLevel: 'all',
    // connectionUrl: 'ws://<docker rails server ip>:3000/cable',
    connectImmediately: true
  });
}