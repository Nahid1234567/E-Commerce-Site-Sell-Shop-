
import VueRouter from 'vue-router'
import Vue from 'vue'
Vue.use(VueRouter)

import AdminDashboard from '../components/admin/AdminDashboard.vue'
import AdminLogin from '../components/admin/auth/AdminLogin.vue'
import CategoryList from '../components/admin/Category/CategoryList.vue'
import BrandList from '../components/admin/Brand/BrandList.vue'
import OrderList from '../components/admin/Order/OrderList.vue'
import OrderDetails from '../components/admin/Order/OrderDetails.vue'
import ProductList from '../components/admin/Product/ProductList.vue'
import CustomerList from '../components/admin/Customer/CustomerList.vue'
import AddOrUpdateProduct from '../components/admin/Product/AddOrUpdateProduct.vue'

const router = new VueRouter({
    routes:[
        {path:'/admin/dashboard', component: AdminDashboard, name:'AdminDashboard'},
        {path:'/admin/login', component: AdminLogin, name:'AdminLogin'},
        {path:'/admin/categories', component: CategoryList, name:'CategoryList'},
        {path:'/admin/brands', component: BrandList, name:'BrandList'},
        {path:'/admin/orders', component: OrderList, name:'OrderList'},
        {path:'/admin/order-details/:orderId', component: OrderDetails, name:'Order Details'},
        {path:'/admin/customers', component: CustomerList, name:'CustomerList'},
        {path:'/admin/products', component: ProductList, name:'ProductList'},
        {path:'/admin/add-new-product', component: AddOrUpdateProduct, name:'AddOrUpdateProduct'},
        {path:'/admin/edit-product/:productId', component: AddOrUpdateProduct, name:'EditProduct'},
    ],
    mode:'history',
    linkActiveClass:'active'
})

    router.beforeEach((to , from, next) => {
    let isAuthenticated ='';
    let authUser = localStorage.getItem('adminLoggedIn') ? JSON.parse(localStorage.getItem('adminLoggedIn')) :false;
    if(authUser){
        isAuthenticated = authUser.id && authUser.email ? true : false;
    }
    else{
        isAuthenticated = false;
    }
    if(to.name !== 'AdminLogin' && !isAuthenticated) next({name: 'AdminLogin'})
    else if(to.name === 'AdminLogin' && isAuthenticated){
        next({name:'AdminDashboard'})
    }
    else next()
})



export default router
  
