import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

export const category = {
    namespaced: true,
    
    state:{
        category:{}

    },
    getters:{
        getAllCategories(state){
         return state.category;
        }
    },
    actions:{
        getCategory(context, payload){
            axios.get('/admin/category/?page='+payload)
            .then((result)=>{
              context.commit('getCategory', result.data.categories)
        })
        .catch((err)=>{
            // console.log(err)
            // this.errors = err.response.data.errors
        });
      },
        deleteCategory(context, payload){
            axios.delete('/admin/category/'+ payload)
            .then((result)=>{
              context.commit('getCategory', result.data.categories)
            
        })
        
      },
      categoryListAll(context, payload){
        axios.get('/admin/all-category/?page='+payload)
        .then((result)=>{
          context.commit('getCategory', result.data.categories)
        })
      }    

    },
    mutations:{
        getCategory(state, payload){
            return state.category = payload;
        },
    },
}

