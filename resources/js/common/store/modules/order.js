import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

export const order = {
    namespaced: true,
    
    state:{
        order:[],
        single_order:[],
        user_single_order:[]

    },
    getters:{
        getAllOrders(state){
         return state.order;
        },
        getSingleOrder(state){
          return state.single_order;
        },
        userGetSingleOrder(state){
          return state.user_single_order;
        }
    },
    actions:{
        getOrder(context, payload){
            axios.get('/user/order-list/?page='+payload)
            .then((result)=>{
              context.commit('getOrder', result.data.orders)
        })
        .catch((err)=>{
            // console.log(err)
            // this.errors = err.response.data.errors
        });
      },
      usergetOrder(context, payload){
        axios.get('/admin/order/?page='+payload)
        .then((result)=>{
          context.commit('getOrder', result.data.orders)
    })
      .catch((err)=>{
          // console.log(err)
          // this.errors = err.response.data.errors
        });
      },
      getSingleOrder(context, payload){
          axios.get(`/admin/order-detail/${payload}`)
          .then((result)=>{
            context.commit('getSingleOrder', result.data.single_order)
         })
      .catch((err)=>{
          // console.log(err)
          // this.errors = err.response.data.errors
       });
      },
      userGetSingleOrder(context, payload){
        axios.get(`/user/order-detail/${payload}`)
        .then((result)=>{
          context.commit('userGetSingleOrder', result.data.user_single_order)
       })
      .catch((err)=>{
          // console.log(err)
          // this.errors = err.response.data.errors
        });
      },
        deleteOrder(context, payload){
            axios.post('/admin/deleteOrder/'+ payload)
            .then((result)=>{
              context.commit('getOrder', result.data.orders)
            
        })
        .catch((err)=>{
          // console.log(err)
          // this.errors = err.response.data.errors
        });
      },
      //   userDeleteOrder(context, payload){
      //     axios.post('/user/deleteOrder/'+ payload)
      //     .then((result)=>{
      //        context.commit('getOrder', result.data.orders)
          
      // })
      //   .catch((err)=>{
      //     // console.log(err)
      //     // this.errors = err.response.data.errors
      //   });
        
      // },
      orderListAll(context, payload){
        axios.get('/admin/all-order/?page='+payload)
        .then((result)=>{
          context.commit('getOrder', result.data.orders)
        })
      }    

    },
    mutations:{
        getOrder(state, payload){
            return state.order = payload;
        },
        getSingleOrder(state, payload){
          return state.single_order = payload;
        },
        userGetSingleOrder(state, payload){
        return state.user_single_order = payload;
        }
    },
}

