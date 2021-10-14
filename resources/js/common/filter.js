import Vue from 'vue'
import moment from 'moment'

Vue.filter('timeformat', (arg)=>{ 
    return moment().format("Do MMM YYYY");
})