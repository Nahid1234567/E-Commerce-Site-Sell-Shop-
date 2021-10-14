import Vue from 'vue';
import Vuex from 'vuex'
Vue.use(Vuex)

import {user} from './modules/user.js'
import {admin} from './modules/admin.js'
import {category} from './modules/category.js'
import {brand} from './modules/brand.js'
import {product} from './modules/product.js'
import {wishlist} from './modules/wishlist.js'
import {cart} from './modules/cart.js'
import {order} from './modules/order.js'

export const store = new Vuex.Store({ 
   modules:{
      user : user,
      admin : admin,
      category : category,
      brand : brand,
      product : product,
      wishlist : wishlist,
      cart : cart,
      order : order
   }
});


