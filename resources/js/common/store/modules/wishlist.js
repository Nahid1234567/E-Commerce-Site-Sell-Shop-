import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

export const wishlist = {
    namespaced: true,
    
    state:{
        wishlist:{}

    },
    getters:{
        getAuthWishlist(state){
         return state.wishlist;

        }
    },
    actions:{
        getWishlist(context, payload){
            axios.get('/user/wishlist/?page='+payload)
            .then((result)=>{
              context.commit('getWishlist', result.data.wishlists)
        })
        .catch((err)=>{
            // console.log(err)
            // this.errors = err.response.data.errors
        });
      },
      wishlistAll(context, payload){
        axios.get('/user/all-wishlist/?page='+payload)
        .then((result)=>{
          context.commit('getWishlist', result.data.wishlists)
        })
    },
      deleteWishlist(context, payload){
        axios.delete('/user/wishlist/'+ payload)
        .then((result)=>{
          context.commit('getWishlist', result.data.wishlists)
        
       })
     
    },

  },
    mutations:{
        getWishlist(state, data){
            return state.wishlist = data;
        },
    
    },
}

