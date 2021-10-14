import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

export const admin = {
    namespaced: true,
    
    state:{
        admin:{}

    },
    getters:{
        getAuthAdmin(state){
         return state.admin;

        }
    },
    actions:{
        getAdmin(context){
            axios.get('/admin/user')
            .then((result)=>{
              context.commit('getAdmin', result.data.admin)
        })
        .catch((err)=>{
            console.log(err)
            this.errors = err.response.data.errors
        });
    },
    //     userLogout(context){
    //         axios.post('/logout')
    //         .then(res=>{
    //          context.commit('getUser', res.data)
    //   })
    //     .catch((err)=>{
    //         // console.log(err)
    //         // this.errors = err.response.data.errors
    //     });
    // }

    },
    mutations:{
        getAdmin(state, data){
            return state.admin = data;
        },
    
    },
}

