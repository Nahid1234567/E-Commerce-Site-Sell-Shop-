require('./bootstrap');

window.Vue = require('vue');
import router from './admin/router';
Vue.component('admin-master', require('./components/admin/AdminMaster.vue').default);
import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/en'
import 'element-ui/lib/theme-chalk/index.css';
Vue.use(ElementUI, {locale})
import moment from 'moment'

Vue.filter('timeformat', (arg)=>{ 
    return moment().format("Do MMM YYYY");
})

import {store} from './common/store/store.js'
import {library} from './common/library.js'

const admin = new Vue({
    el:'#admin',
    library,
    ElementUI,
    locale,
    router,
    store,
    data:{
    }
});