import Vue from 'vue';
import { FontAwesomeIcon }  from '@fortawesome/vue-fontawesome';
import { config, library }  from '@fortawesome/fontawesome-svg-core';
import { faFeather }        from '@fortawesome/free-solid-svg-icons';

config.autoAddCss = false;

const feather = [faFeather];

feather.forEach(icon => library.add(icon));

Vue.component('fa', FontAwesomeIcon);