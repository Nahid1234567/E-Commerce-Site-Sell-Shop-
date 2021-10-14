import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

export const user = {
    namespaced: true,
    
    state:{
        user:{},
        userList:[]

    },
    getters:{
        getAuthUser(state){
         return state.user;

        },
        userList(state){
         return state.userList;
   
        }
    },
    actions:{
        getUser(context){
            axios.get('/user')
            .then((result)=>{
              context.commit('getUser', result.data.user)
        })
        .catch((err)=>{
            console.log(err)
            this.errors = err.response.data.errors
        });
      },

        userList(context, payload){
            axios.get('/admin/user-list/?page='+payload)
            .then((result)=>{
              context.commit('userList', result.data.user_list)
        })
        .catch((err)=>{
            console.log(err)
            this.errors = err.response.data.errors
        });
    },
        userLogout(context){
            axios.post('/logout')
            .then(res=>{
             context.commit('getUser', res.data)
      })
        .catch((err)=>{
            console.log(err)
            this.errors = err.response.data.errors
        });
      }

    },
    mutations:{
        getUser(state, data){
            return state.user = data;
        },

        userList(state, payload){
            return state.userList = payload;
        }
    
    },
}

