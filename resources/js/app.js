require('./bootstrap');
import router from './public/router';
import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)
window.Vue = require('vue');
Vue.component('public-master', require('./components/public/PublicMaster.vue').default);
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/en'
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI, {locale})
import moment from 'moment'

Vue.filter('timeformat', (arg)=>{ 
    return moment().format("Do MMM YYYY");
})

import {library} from './common/library.js'
import {store} from './common/store/store.js'
const app = new Vue({
    el:'#app',
    library,
    router,
    ElementUI,
    locale,
    store,
    data:{
        test : 'testing for frontend!'
    }
});