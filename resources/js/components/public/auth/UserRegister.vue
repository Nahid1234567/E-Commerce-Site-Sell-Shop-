<template>
     <div>
    <section class="pages login-page section-padding">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="main-input padding60 new-customer">
							<div class="log-title">
								<h3><strong>new customers</strong></h3>
							</div>
							<div class="custom-input">
								<form action="mail.php" method="post" @submit.prevent="userRegister()">
									<input type="text" v-model="form.name" placeholder="Name here.." />
                                    <span class="text-danger" v-if="errors['name']">{{errors['name'][0]}}</span>
									<input type="email" v-model="form.email" placeholder="Email Address.." />
                                    <span class="text-danger" v-if="errors['email']">{{errors['email'][0]}}</span>
									<input type="password" v-model="form.password" placeholder="Password" />
									<span class="text-danger" v-if="errors['password']">{{errors['password'][0]}}</span>
									<input type="password" v-model="form.password_confirmation" placeholder="Confirm Password" /> 
									<span class="text-danger" v-if="errors['password_confirmation']">{{errors['password_confirmation'][0]}}</span>                                  
									<input type="text" v-model="form.phone" placeholder="Phone Number.." />
                                    <input type="text" v-model="form.address" placeholder="Adderes.." />									

									<label class="first-child">
										<input type="radio" name="rememberme" value="forever">
										Sign up for our newsletter!
									</label>
									<div class="submit-text coupon">
										<button type="submit">Register</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
    </div>
</template>

<script>

 export default{
    name: "UserRegister",
    data(){
        return{
            errors:{},
            form:{              
          }
        }
    },
    methods:{
        userRegister(){
            axios.post('/register', this.form)
            .then((result)=>{
            this.$router.push({name:'User Dashboard'})
			this.$message({
			message: 'Congrats! You Have Been Registered As A New User!.',
			type: 'success'
			});

        })
        .catch((err)=>{
             console.log(err)
             this.errors = err.response.data.errors
     });

    }

  }

}
</script>