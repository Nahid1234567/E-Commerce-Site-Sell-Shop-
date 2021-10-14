<template>
   <div class="container">
        <section class="pages checkout section-padding">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="main-input single-cart-form padding60">
							<div class="log-title">
								<h3><strong>billing details</strong></h3>
							</div>
							<div class="custom-input">
								<form action="mail.php" method="post">

									<input readonly type="text" v-model="form.name" placeholder="Name here.." />
                                    <span class="text-danger" v-if="errors['name']">{{errors['name'][0]}}</span>
									<input readonly type="email" v-model="form.email" placeholder="Email Address.." />
                                    <span class="text-danger" v-if="errors['email']">{{errors['email'][0]}}</span>
									<input readonly type="text" v-model="form.phone" placeholder="Phone Number.." />
                                    <input type="text" v-model="form.address" placeholder="Adderes.." />
								
								</form>									                                
							</div>							    
									<input type="checkbox" v-model="shippingDisplay"> &nbsp;								
									<label>Ship to different address</label>
						</div>
					</div>
					<div class="col-sm-6" v-if="shippingDisplay">
						<div class="main-input single-cart-form padding60">
							<div class="log-title">
								<h3><strong>Ship to different address</strong></h3>
							</div>
							<div class="custom-input">
								<form action="mail.php" method="post">

									<input type="text" v-model="shipping.name" placeholder="Name here.." />
                                    <span class="text-danger" v-if="errors['name']">{{errors['name'][0]}}</span>
									<input type="email" v-model="shipping.email" placeholder="Email Address.." />
                                    <span class="text-danger" v-if="errors['email']">{{errors['email'][0]}}</span>
									<input type="text" v-model="shipping.phone" placeholder="Phone Number.." />
                                    <input type="text" v-model="shipping.address" placeholder="Adderes.." />

								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row margin-top">
					<div class="col-xs-12 col-sm-6">
						<div class="padding60">
							<div class="log-title">
								<h3><strong>Our order</strong></h3>
							</div>
							<div class="cart-form-text pay-details table-responsive">
								<table>
									<thead>
										<tr>
											<th>Product</th>
											<td>Total</td>
										</tr>
									</thead>
									<tbody>
										<tr v-for="product in products.products" :key="product.id">
                                        <th>{{product.name}} x {{product.quantity}}</th>
										<td>{{product.price * product.quantity}}</td>
										</tr>
										<!-- <tr>
											<th>Cart Subtotal</th>
											<td>$155.00</td>
										</tr>
										<tr>
											<th>Shipping and Handing</th>
											<td>$15.00</td>
										</tr>
										<tr>
											<th>Vat</th>
											<td>$00.00</td>
										</tr> -->
									</tbody>
									<tfoot>
										<tr>
											<th>Order total</th>
											<td>{{products.total}}</td>
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6">
						<div class="padding60">
							<div class="log-title">
								<h3><strong>Payment method</strong></h3>
							</div>
							<div class="categories">
								<ul id="accordion" class="panel-group clearfix">
									<li class="panel">
									<label for="payment" style="font-size: medium;">Choose a Payment Method</label><br><br>
									  <select class="form-control form-select" name="payment" id="payment" style="width:40%; height:40%; font-family: sans-serif; border-width:1.5px;" v-model="payment_type" @change="cardPayment">
                                        <option value="cash_on_delivery">Cash On Delivery</option>
                                        <option value="card_payment">Card Payment</option>
									  </select>
									</li>
									<div v-if="stripeError">
										<span style="color:red">{{stripeError}}</span>
									</div>
									<div v-if="payment_type === 'card_payment'">
                                          <input type="number" style = "border: 1px solid black;" placeholder="Card no" v-model="cardPayment.cardNumber" required>
										  <input type="number" style = "border: 1px solid black;" placeholder="Exp Month" v-model="cardPayment.expMonth" required><br>
										  <input type="number" style = "border: 1px solid black;" placeholder="Exp Year" v-model="cardPayment.expYear" required>
										  <input type="number" style = "border: 1px solid black;" placeholder="Card CVC" v-model="cardPayment.cvc" required>
									</div>

									<!-- <li class="panel">
										<div data-toggle="collapse" data-parent="#accordion" data-target="#collapse2">
											<div class="medium-a">
												cheque payment
											</div>
										</div>
										<div class="paypal-dsc panel-collapse collapse" id="collapse2">
											<div class="normal-a">
												<p>Lorem Ipsum is simply in dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.</p>
											</div>
										</div>
									</li>
									<li class="panel">
										<div data-toggle="collapse" data-parent="#accordion" data-target="#collapse3">
											<div class="medium-a">
												paypal
											</div>
										</div>
										<div class="paypal-dsc panel-collapse collapse" id="collapse3">
											<div class="normal-a">
												<p>Lorem Ipsum is simply in dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry.</p>
											</div>
										</div>
									</li> -->
								</ul>
								<div class="submit-text" v-if="products.total > 0">
									<a href="#" @click.prevent="placeOrder">place order</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
        </section>
   </div>
</template>

<script>
export default {
    name: 'CheckOut',
    data(){
        return{
          shippingDisplay: false,
          errors:[],
		  stripeError:'',
          form:{

          },
          shipping:{
             
          },
		  cardPayment:{
             cardNumber: '',
			 cvc: '',
			 expMonth: '',
			 expYear:''
		  },
		  payment_type: 'cash_on_delivery'
        }
    },
    methods:{
       productList(){
        this.$store.dispatch('cart/getProduct');
       },
	   placeOrder(){
		if(this.user.id){
			axios.post('checkout',{
				shipping : this.shipping,
				shipping_address : this.shippingDisplay,
				payment_type : this.payment_type,
				cardInfo : this.cardPayment
			})
			.then((res)=>{
			    this.$router.push({name: 'User Dashboard'});
			})
			.catch((err)=>{
				// console.log(err)
				this.stripeError = err.response.data['message']
			});
		}
		else{
			this.$router.push({name: 'User Login'});
		}
	   },
	   getUser(){
			this.$store.dispatch('user/getUser');
		},
    },
    created(){
        this.productList();
		this.getUser();
    },
    watch:{
       user:{
			handler: function(newVal, oldVal){
				this.form = newVal;
			},
			deep: true
	   }
	},
    computed:{
        products(){
            return this.$store.getters["cart/getAuthProduct"];
        },
		user(){
			    return this.$store.getters['user/getAuthUser'];
		},
    }
}
</script>

<style>

</style>