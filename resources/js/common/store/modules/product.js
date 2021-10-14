import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)
import axios from 'axios'

export const product = {
    namespaced: true,
    
    state:{
        products:{},
        product:{},
        sidebarInfo:{}

    },
    getters:{
        getAuthProduct(state){
         return state.products;
        },
        getSingleProduct(state){
            return state.product;
        },
        productSidebarInfo(state){
            return state.sidebarInfo;
        }

    },
    actions:{
        getProduct(context, payload){
            axios.get('/admin/product/?page='+payload)
            .then((res)=>{
              context.commit('getProduct', res.data.products)
        })
        .catch((err)=>{
            // console.log(err)
            // this.errors = err.response.data.errors
        });
      },
        getAllProduct(context, payload){
        axios.get('/product-list/?page='+payload)
        .then((res)=>{
          context.commit('getProduct', res.data.products)
        })
        .catch((err)=>{
            // console.log(err)
            // this.errors = err.response.data.errors
        });
      },
      editProduct(context, payload){
        axios.get(`/admin/product/${payload}/edit`)
        .then((res)=>{
          context.commit('singleProduct', res.data.product)
     })
    .catch((err)=>{
        // console.log(err)
        // this.errors = err.response.data.errors
       });
     },
     productSidebarInfo(context){
        axios.get('/product-sidebar-info')
        .then((res)=>{
          context.commit('productSidebarInfo', res.data)
     })
    .catch((err)=>{
        // console.log(err)
        // this.errors = err.response.data.errors
       });
     },
     productFilter(context, payload){
      axios.get(`/product-filter/${payload}`)
      .then((res)=>{
        context.commit('getProduct', res.data.products)
      })
      .catch((err)=>{
          // console.log(err)
          // this.errors = err.response.data.errors
        });
      },
      deleteProduct(context, payload){
        axios.delete('/admin/product/'+ payload)
        .then((result)=>{
          context.commit('getProduct', result.data.products)
        
    })
    
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
        getProduct(state, payload){
            return state.products = payload;
        },
        singleProduct(state, payload){
            return state.product = payload;
        },  
        productSidebarInfo(state, payload){
            return state.sidebarInfo = payload;  
        }
    },
}

