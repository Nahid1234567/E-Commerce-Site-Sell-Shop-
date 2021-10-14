import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

export const brand = {
    namespaced: true,
    
    state:{
        brand:{}

    },
    getters:{
        getAuthBrand(state){
         return state.brand;

        }
    },
    actions:{
        getBrand(context, payload){
            axios.get('/admin/brand/?page='+payload)
            .then((result)=>{
              context.commit('getBrand', result.data.brands)
        })
        .catch((err)=>{
            // console.log(err)
            // this.errors = err.response.data.errors
        });
      },
      brandListAll(context, payload){
        axios.get('/admin/all-brand/?page='+payload)
        .then((result)=>{
          context.commit('getBrand', result.data.brands)
        })
    },
      deleteBrand(context, payload){
        axios.delete('/admin/brand/'+ payload)
        .then((result)=>{
          context.commit('getBrand', result.data.brands)
        
       })
     
    },

  },
    mutations:{
        getBrand(state, data){
            return state.brand = data;
        },
    
    },
}

