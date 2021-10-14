<template>
   <div class="container">
      <section class="pages products-page section-padding-bottom" style="padding-top: 20px">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-4 col-md-3">
						<product-side-bar></product-side-bar>
					</div>
					<div class="col-xs-12 col-sm-8 col-md-9">
						<div class="right-products">
							<div class="row">
								<div class="col-xs-12">
									<div class="section-title clearfix">
										<ul>
											<li>
												<ul class="nav-view">
													<li class="active"><a data-toggle="tab" href="#grid" class="active"> <i class="mdi mdi-view-module"></i> </a></li>
													<li><a data-toggle="tab" href="#list" class="active"> <i class="mdi mdi-view-list"></i> </a></li>
												</ul>
											</li>
											<li class="sort-by floatright">
												Showing 1-9 of 89 Results
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="tab-content grid-content">
									<div class="tab-pane fade in active text-center" id="grid">
										<div class="col-xs-12 col-sm-6 col-md-4" v-for="product in products.data" :key="product.id">
											<div class="single-product">
												<div class="product-img">
													<div class="pro-type">
														<span>new</span>
													</div>
													<a href="#"><img :src="`/uploads/${product.image}`" :alt="product.name" width="180" height="180" /></a>
													<div class="actions-btn">
														<a href="#" @click.prevent="addToCart(product)"><i class="mdi mdi-cart"></i></a>
														<a href="#" @click.prevent="addToWishList(product)"><i class="mdi mdi-heart"></i></a>
														<a href="#" @click.prevent="singleProductView(product)" data-toggle="modal" data-target="#quick-view"><i class="mdi mdi-eye"></i></a>                                                      
													</div>
												</div>
												<div class="product-dsc">
													<p><a href="#">{{product.name}}t</a></p>
													<!-- <div class="ratting">
														<i class="mdi mdi-star"></i>
														<i class="mdi mdi-star"></i>
														<i class="mdi mdi-star"></i>
														<i class="mdi mdi-star-half"></i>
														<i class="mdi mdi-star-outline"></i>
                                                          Work to be done
													</div> -->
													<span>{{currency}} {{product.price}}</span>
												</div>
											</div>
										</div>
										<!-- single product end -->
									</div>
									<div class="tab-pane fade in" id="list">
										<div class="col-xs-12">
											<div class="single-list-view" v-for="product in products.data" :key="product.id">
												<div class="row">
													<div class="col-xs-12 col-md-4">
														<div class="list-img">
															<div class="product-img">
																<div class="pro-type sell">
																	<span>sell</span>
																</div>
																<a href="#"><img :src="`/uploads/${product.image}`" :alt="product.name" width="180" height="180" /></a>
															</div>
														</div>
													</div>
													<div class="col-xs-12 col-md-8">
														<div class="list-text">
															<h3>{{product.name}}</h3>
															<span>Summer men’s fashion</span>
															<!-- <div class="ratting floatright">
																<p>( 27 Rating )</p>
																<i class="mdi mdi-star"></i>
																<i class="mdi mdi-star"></i>
																<i class="mdi mdi-star"></i>
																<i class="mdi mdi-star-half"></i>
																<i class="mdi mdi-star-outline"></i>
                                                                 Work to be done
															</div> -->
															<h5 v-if="product.discount_ptice"><del>{{currency}} {{product.price}}</del><span>{{currency}} {{product.discount_price}}</span></h5>
                                                            <h5 v-else><span>{{currency}} {{product.price}}</span></h5>
															<p>{{product.description}}</p>
															<div class="list-btn">
																<a href="#" @click.prevent="addToCart(product)">add to cart</a>
																<a href="#" @click.prevent="addToWishList(product)">wishlist</a>
																<a href="#" @click.prevent="singleProductView(product)" data-toggle="modal" data-target="#quick-view">zoom</a>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- single product end -->
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="pagnation-ul">
										<!-- <ul class="clearfix">
											<li><a href="#"><i class="mdi mdi-menu-left"></i></a></li>
											<li><a href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#">5</a></li>
											<li><a href="#">...</a></li>
											<li><a href="#">10</a></li>
											<li><a href="#"><i class="mdi mdi-menu-right"></i></a></li>
										</ul> -->
                                          <el-pagination
                                                class="text-center"
                                                background
                                                    @current-change="handleCurrentChange"
                                                    :current-page.sync="currentPage"
                                                    :page-size="products.per_page"
                                                layout="prev, pager, next"
                                                :total="products.total">
                                            </el-pagination>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- product-grid-view content section end -->
        <!-- quick view start -->
		<div class="product-details quick-view modal animated zoomInUp" id="quick-view">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="d-table">
							<div class="d-tablecell">
								<div class="modal-dialog">
									<div class="main-view modal-content">
										<div class="modal-footer" data-dismiss="modal">
											<span>x</span>
										</div>
										<div class="row">
											<div class="col-xs-12 col-sm-5 col-md-4">
												<div class="quick-image">
													<div class="single-quick-image text-center">
														<div class="list-img">
                                                           <a href="#"><img :src="`/uploads/${product.image}`" :alt="product.name" width="180" height="180" /></a>
															<!-- <div class="product-img tab-content">
																<div class="simpleLens-container tab-pane fade in" id="q-sin-1">
																	<div class="pro-type">
																		<span>new</span>
																	</div>
																	<a class="simpleLens-image" data-lens-image="img/products/z1.jpg" href="#"><img src="img/products/z1.jpg" alt="" class="simpleLens-big-image"></a>
																</div>
																<div class="simpleLens-container tab-pane active fade in" id="q-sin-2">
																	<div class="pro-type sell">
																		<span>sell</span>
																	</div>
																	<a class="simpleLens-image" data-lens-image="img/products/z2.jpg" href="#"><img src="img/products/z2.jpg" alt="" class="simpleLens-big-image"></a>
																</div>
																<div class="simpleLens-container tab-pane fade in" id="q-sin-3">
																	<div class="pro-type">
																		<span>-15%</span>
																	</div>
																	<a class="simpleLens-image" data-lens-image="img/products/z3.jpg" href="#"><img src="img/products/z3.jpg" alt="" class="simpleLens-big-image"></a>
																</div>
																<div class="simpleLens-container tab-pane fade in" id="q-sin-4">
																	<div class="pro-type">
																		<span>new</span>
																	</div>
																	<a class="simpleLens-image" data-lens-image="img/products/z4.jpg" href="#"><img src="img/products/z4.jpg" alt="" class="simpleLens-big-image"></a>
																</div>
															</div> -->
														</div>
													</div>
													<!-- <div class="quick-thumb">
														<ul class="product-slider">
															<li><a data-toggle="tab" href="#q-sin-1"> <img src="img/products/s1.jpg" alt="quick view" /> </a></li>
															<li class="active"><a data-toggle="tab" href="#q-sin-2"> <img src="img/products/s2.jpg" alt="small image" /> </a></li>
															<li><a data-toggle="tab" href="#q-sin-3"> <img src="img/products/s3.jpg" alt="small image" /> </a></li>
															<li><a data-toggle="tab" href="#q-sin-4"> <img src="img/products/s4.jpg" alt="small image" /> </a></li>
														</ul>
													</div> -->
												</div>						
											</div>
											<div class="col-xs-12 col-sm-7 col-md-8">
												<div class="quick-right">
													<div class="list-text">
														<h3>{{product.name}}</h3>
														<span v-if="product.category">{{product.category.name}}</span>
														<div class="ratting floatright">
															<p>( 27 Rating )</p>
															<i class="mdi mdi-star"></i>
															<i class="mdi mdi-star"></i>
															<i class="mdi mdi-star"></i>
															<i class="mdi mdi-star-half"></i>
															<i class="mdi mdi-star-outline"></i>
														</div>
															<h5 v-if="product.discount_ptice"><del>{{currency}} {{product.price}}</del><span>{{currency}} {{product.discount_price}}</span></h5>
                                                            <h5 v-else><span>{{currency}} {{product.price}}</span></h5>
														<p>{{product.description}}</p>
														<div class="all-choose">
															<!-- <div class="s-shoose">
																<h5>Color</h5>
																<div class="color-select clearfix">
																	<span></span>
																	<span class="outline"></span>
																	<span></span>
																	<span></span>
																</div>
															</div> -->
															<div class="s-shoose">
																<h5>Color</h5>
																<!-- <div v-for="color in product.color" :key="color" class="size-drop"> -->
																	<div>
																		<!-- <button type="button" class="btn">{{color.value}}</button>
																		<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																			<span class=""><i class="mdi mdi-chevron-down"></i></span>
																		</button> -->
																		<ul>
																			<li v-for="color in product.color" :key="color.id">
                                                                               <input type="color" :value="color">
                                                                            </li>
																		</ul>
																	</div>
																<!-- </div> -->
															</div><br>
                                                            <div class="s-shoose">
																<h5>Size</h5>
																<!-- <div v-for="size in product.size" :key="size" class="size-drop"> -->
															     	<div>
																		<!-- <button type="button" class="btn">{{size}}</button>
																		<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
																			<span class=""><i class="mdi mdi-chevron-down"></i></span>
																		</button> -->
																			<ul>
																				<li v-for="size in product.size" :key="size.id">
																				   {{size}}                                                                         
																				</li>
																			</ul>
																	<!-- </div> -->
																    </div>
															</div><br>
															<div class="s-shoose">
																<h5>qty</h5>
																<form action="#" method="POST">
																	<div class="plus-minus">
																		<a class="dec qtybutton">-</a>
																		<input type="text" value="1" name="qtybutton" class="plus-minus-box">
																		<a class="inc qtybutton">+</a>
																	</div>
																</form>
															</div>
														</div>
														<div class="list-btn">
															<a href="#" @click.prevent="addToCart(product)">add to cart</a>
															<a href="#" @click.prevent="addToWishList(product)">wishlist</a>
															<a href="#" @click.prevent="singleProductView(product)" data-toggle="modal" data-target="#quick-view">zoom</a>
														</div>
														<div class="share-tag clearfix">
															<ul class="blog-share floatleft">
																<li><h5>share </h5></li>
																<li><a href="#"><i class="mdi mdi-facebook"></i></a></li>
																<li><a href="#"><i class="mdi mdi-twitter"></i></a></li>
																<li><a href="#"><i class="mdi mdi-linkedin"></i></a></li>
																<li><a href="#"><i class="mdi mdi-vimeo"></i></a></li>
																<li><a href="#"><i class="mdi mdi-dribbble"></i></a></li>
																<li><a href="#"><i class="mdi mdi-instagram"></i></a></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- quick view end -->
   </div>
</template>

<script>

import ProductSideBar from './shop/ProductSideBar.vue'

export default {
    name: 'Shop',
    data(){
        return{
            currency: process.env.MIX_APP_CURRENCY,
            currentPage:1,
            product:{},
			wishlist:{
			  user_id: '',
			  product_id: ''

			}

        }
    },
    components: {
      ProductSideBar
    },
    methods:{
        productList(){
        this.$store.dispatch('product/getAllProduct', this.currentPage);
      },
        handleCurrentChange(){
        this.$store.dispatch('product/getAllProduct', this.currentPage);    
      },
      addToCart(product){
         axios.post('/cart/add-to-cart', product)
          .then((result)=>{					  	 
				this.$message({
				message: 'Product Added to your Cart!',
				type: 'success'
			  });
			this.$store.dispatch('cart/getProduct');
           })
		.catch((err)=>{
			// console.log(err)
			// this.errors = err.response.data.errors
		});
	  },
      addToWishList(product){
         if(this.user.id){
		    this.wishlist.user_id = this.user.id;
		    this.wishlist.product_id = product.id;
           axios.post('/user/wishlist', this.wishlist)
		    .then((result)=>{
				this.$router.push({name:'User Dashboard'})
				this.$message({
				message: 'Product Added to your Wishlist!.',
				type: 'success'
			  });

           })
		}else{
			this.$router.push({name: 'User Login'});
		}
      },
      singleProductView(product){
         this.product = product;
      }
        
    },
    created(){
        this.productList();
    },
    computed:{
        products(){
            return this.$store.getters["product/getAuthProduct"];
        },
		user(){
		    return this.$store.getters["user/getAuthUser"];
	    }
    }

}
</script>

<style>

</style>