<template>
     <!-- header section start -->
		<header class="header-one header-two">
			<div class="header-top-two">
				<div class="container text-center">
					<div class="row">
						<div class="col-sm-12">
							<div class="middel-top">
								<div class="left floatleft">
									<p><i class="mdi mdi-clock"></i> Mon-Fri : 09:00-19:00</p>
								</div>
							</div>
							<div class="middel-top clearfix">
								<ul class="clearfix right floatright">
									<li  v-if="user && user.id">
										<a href="#"><i class="mdi mdi-account"></i></a>
										<ul>
											<li><router-link :to="{name:'User Dashboard'}">My Account</router-link></li>
											<li><a href="" @click.prevent="userLogout()">Logout</a></li>
											<li>
												<a v-bind:href="route">
												<!-- <i class="fas fa-exchange-alt"></i> -->
												  Change Password
												</a>
											</li>
										</ul>
									</li>	

									<li v-else>	
										<a href="#"><i class="mdi mdi-account"></i></a>						
										<ul>
											<li><router-link :to="{name:'User Login'}">Login</router-link></li>
											<li><router-link :to="{name:'User Register'}">Register</router-link></li>
										</ul>
									</li>
									
									<li>
										<a href="#"><i class="mdi mdi-settings"></i></a>
										<ul>
											<!-- <li><a href="myaccount.html">">My account</a></li> -->
											<li><router-link :to="{name:'Shop'}">Shop</router-link></li>
											<li><router-link :to="{name:'Cart'}">Cart</router-link></li>										
											<li><router-link :to="{name:'WishList'}">WishList</router-link></li>
										    <li><router-link :to="{name:'About'}">About</router-link></li>											
											<li><router-link :to="{name:'Contact'}">Contact</router-link></li>
											<li><router-link :to="{name:'CheckOut'}">Check Out</router-link></li>
										</ul>
									</li>
								</ul>
								<div class="right floatright">
									<form action="#" method="get">
										<button type="submit"><i class="mdi mdi-magnify"></i></button>
										<input type="text" placeholder="Search within these results..." />
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container text-center">
				<div class="row">
					<div class="col-sm-2">
						<div class="logo">

						  <router-link :to="{name:'Home'}">
							<a href="index.html"><img src="/assets/public/img/logo2.png" alt="Sellshop" /></a>
						  </router-link>

						</div>
					</div>
					<div class="col-sm-8">
						<div class="header-middel">
							<div class="mainmenu">
								<nav>
									<ul>
										<li><router-link :to="{name:'Home'}">Home</router-link></li>
										<li><router-link :to="{name:'Shop'}">Shop</router-link></li>
										<li><router-link :to="{name:'WishList'}">WishList</router-link></li>
										<li><router-link :to="{name:'About'}">About</router-link></li>
										<li><router-link :to="{name:'Contact'}">Contact</router-link></li>
										<li><router-link :to="{name:'CheckOut'}">Check Out</router-link></li>
									</ul>		
								</nav>
							</div>
							<!-- mobile menu start -->
							<div class="mobile-menu-area">
								<div class="mobile-menu">
									<nav id= "dropdown">
										<ul>
											<li><router-link :to="{name:'Home'}">Home</router-link></li>
											<li><router-link :to="{name:'Shop'}">Shop</router-link></li>
											<li><router-link :to="{name:'About'}">About</router-link></li>
											<li><router-link :to="{name:'Contact'}">Contact</router-link></li>
										</ul>		
								    </nav>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="cart-itmes">
							<router-link :to="{name:'Cart'}">
								<a class="cart-itme-a" href="cart.html">
									<i class="mdi mdi-cart"></i>
									{{products.total_qty}} items : <strong>${{products.total}}</strong>
								</a>
							</router-link>
							<div class="cartdrop">
								<div class="sin-itme clearfix" v-for="product in products.products" :key="product.id">
									<i class="mdi mdi-close" @click.prevent ="removeFromCart(product.id)"></i>
									<a class="cart-img" href="cart.html"><img :src="`/uploads/${product.attributes['image']}`" alt="Add Product" /></a>
									<div class="menu-cart-text">
										<a href="#"><h5>{{product.name}}</h5></a>
											<p class="productcolor">Color :&nbsp; 
												<span>
												  <input type="color" :value="product.attributes['color']">
												</span> 
                                            </p><br>                                              
											<p class="productcolor">Size  : <b>{{product.attributes['size']}}</b></p><br>
										    <p class="productcolor">Price: <strong style="color:red;">&nbsp;${{product.price}}</strong></p>
									</div>
								</div>
								<!-- <td class="td-img text-left">
											<a href="#"><img :src="`/uploads/${product.attributes['image']}`" alt="Add Product" /></a>
											<div class="products-dsc">
												<h5><a href="#">{{product.name}}</a></h5>
												<p class="productcolor">Color : <span>{{product.attributes['color']}}</span></p>
												<p class="productcolor">Size   : <span>{{product.attributes['size']}}</span></p>
											</div>
										</td>
								<td>{{product.price}}</td> -->
								<!-- <div class="sin-itme clearfix" v-for="product in products.products" :key="product.id">
									<i class="mdi mdi-close"></i>
									<a class="cart-img" href="cart.html"><img src="/assets/public/img/cart/2.png" alt="" /></a>
									<div class="menu-cart-text">
										<a href="#"><h5>men’s black t-shirt</h5></a>
										<span>Color :  Black</span>
										<span>Size :     SL</span>
										<strong>$132.00</strong>
									</div>
								</div> -->
								<div class="total">
									<span>total <strong>= ${{products.total}}</strong></span>
								</div>
								<router-link :to="{name:'Cart'}" style="font-weight:bolder; color:#ff2300e6;">Go TO Cart</router-link><br><br>
								<router-link :to="{name:'CheckOut'}" class="out-menu">Check Out</router-link>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
        <!-- header section end -->
</template>

<script>
    
    export default {
        name: "PublicHeader",
        data() {
			return {
				route:'change-user-password'
			}
		},
		computed:{
		    user(){
			    return this.$store.getters['user/getAuthUser'];
			},
			products(){
                return this.$store.getters["cart/getAuthProduct"];
            }			
		},
		methods:{
			productList(){
			this.$store.dispatch('cart/getProduct');
			},
			removeFromCart(id){
			axios.get('cart/remove-from-cart/'+id)
				.then((result)=>{
				  this.productList();
			 })
			},
			getUser(){
			this.$store.dispatch('user/getUser');
			},
			userLogout(){
			this.$store.dispatch('user/userLogout')			
			this.$router.push({name: 'Home'})
			localStorage.removeItem('userLoggedIn');
			this.$message({
			message: 'You Have Been Logged Out!',
			type: 'success'
			});
		  }
		},
		created(){
		  this.getUser();
		  this.productList();
		}
    
    }
</script>
 