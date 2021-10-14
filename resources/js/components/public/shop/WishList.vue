<template>
   <div class="container">
      <section class="pages wishlist-page section-padding">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="table-responsive padding60">
							<table class="wishlist-table text-center">
								<thead>
									<tr>
										<th>Product</th>
										<th>Price</th>
										<th>Stock Status </th>
										<th>Add To Cart</th>
										<th>Remove</th>
									</tr>
								</thead>
								<tbody>
									<tr v-for="wishlist in wishlists.data" :key="wishlist.id">
										<td class="td-img text-left">
											<a href="#"><img :src="`/uploads/${wishlist.product.image}`" :alt="wishlist.product.name" /></a>
											<div class="items-dsc">
                                            <h5><a href="#">{{wishlist.product.name}}</a></h5>
												<p class="itemcolor">Color : 
                                                    <span class="color-select clearfix">
                                                        <span :style="`background:${color.value}`" v-for="color in wishlist.product.color" :key="color.value">
															 <input type="color" :value="color">
														</span>
                                                    </span>
                                                </p>
												<p class="itemsize">Size   : 
                                                    <span v-for="size in wishlist.product.size" :key="size.id">{{size}}</span>
                                                </p>
											</div>
										</td>
										<td>{{wishlist.product.price}}</td>
										<td>In Stock</td>
										<td>
											<div class="submit-text">
												<a href="#" @click.prevent="addToCart(wishlist.product)">Add to cart</a>
											</div>
										</td>
										<td @click.prevent="removeFeomWishlist(wishlist.id)"><i class="mdi mdi-close" title="Remove this product"></i></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>
   </div>
</template>

<script>
export default {
    name: 'WishList',
    data(){
        
    return{
	  product:{},
      currentPage:1
     }

    },

    methods:{
       wishList(){
        this.$store.dispatch('wishlist/getWishlist', this.currentPage);    
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
       removeFeomWishlist(id){
          this.$store.dispatch('wishlist/deleteWishlist', id)
          .then((result)=>{
            this.$message({
                message: 'This Product removed from your wishlist',
                type: 'success'
                });
         })
       },
    },
    created(){
       this.wishList();
    },
    computed:{
      wishlists(){
       return this.$store.getters["wishlist/getAuthWishlist"];
    }
  }    
}
</script>

<style>

</style>