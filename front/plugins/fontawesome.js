import Vue from 'vue';
import { FontAwesomeIcon }  from '@fortawesome/vue-fontawesome';
import { config, library }  from '@fortawesome/fontawesome-svg-core';
import { faFeather }        from '@fortawesome/free-solid-svg-icons';
import { faExchangeAlt }    from '@fortawesome/free-solid-svg-icons';

config.autoAddCss = false;

const feather = [faFeather];
const exchange = [faExchangeAlt];

feather.forEach(icon => library.add(icon));
exchange.forEach(icon => library.add(icon));

Vue.component('fa', FontAwesomeIcon);