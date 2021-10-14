import VueRouter from 'vue-router'
import Vue from 'vue'
Vue.use(VueRouter)

import UserLogin from '../components/public/auth/UserLogin.vue'
import UserRegister from '../components/public/auth/UserRegister.vue'
import Home from '../components/public/Home.vue'
import UserDashboard from '../components/public/user/UserDashboard.vue'
import Shop from '../components/public/shop/Shop.vue'
import CheckOut from '../components/public/shop/CheckOut.vue'
import WishList from '../components/public/shop/WishList.vue'
import Contact from '../components/public/shop/Contact.vue'
import Cart from '../components/public/shop/Cart.vue'
import About from '../components/public/shop/About.vue'
import UserOrderDetails from '../components/admin/Order/UserOrderDetails.vue'
import Reset from '../components/public/Reset.vue'

const router = new VueRouter({
    routes:[
        {path:'/', component: Home, name:'Home'},
        {path:'/shop', component: Shop, name:'Shop'},
        {path:'/about', component: About, name:'About'},
        {path:'/contact', component: Contact, name:'Contact'},
        {path:'/cart', component: Cart, name:'Cart'},
        {path:'/order-details/:orderId', component: UserOrderDetails, name:'User Order Details'},
        {path:'/reset/:token', component: Reset, name:'Reset'},
        {path:'/wishlist', component: WishList, name:'WishList',
        
            beforeEnter: (to, from, next) =>{
                const isAuthenticated = localStorage.getItem('userLoggedIn') ? true : false;
                if(to.name == 'User Login' && isAuthenticated) next({name:'User Dashboard'})
                else next()      
            }   
        },
        {path:'/checkout', component: CheckOut, name:'CheckOut',
          
            beforeEnter: (to, from, next) =>{
                const isAuthenticated = localStorage.getItem('userLoggedIn') ? true : false;
                if(to.name == 'User Login' && isAuthenticated) next({name:'User Dashboard'})
                else next()      
            }   
        },
        {path:'/user-login', component: UserLogin, name:'User Login',
        //     beforeEnter:(to, from, next) =>{
        //         const isAuthenticated = localStorage.getItem('userLoggedIn') ? true : false;
        //         if(to.name == 'User Login' && isAuthenticated) next({name:'User Dashboard'})
        //         else next()
   
        //   }
        },
        //User Component

        {path:'/user-register', component: UserRegister, name:'User Register'},

        {path:'/user/user-dashboard', component: UserDashboard, name:'User Dashboard',
        //     beforeEnter:(to, from, next) =>{
        //       const isAuthenticated = localStorage.getItem('userLoggedIn') ? true : false;
        //       if(to.name !== 'User Login' && !isAuthenticated) next({name:'User Login'})
        //       else next()
     
        //   }
        },
    ],
    mode:'history',

})

export default router

