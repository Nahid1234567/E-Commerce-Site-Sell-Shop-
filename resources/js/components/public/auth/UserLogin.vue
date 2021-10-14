<template>
 <div>
    <section class="pages login-page section-padding">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="main-input padding60">
							<div class="log-title">
							</div>
							<div class="login-text">
								<div class="custom-input">
								  <p>If you have an account with us Please log in, Otherwise &nbsp; <router-link :to="{name:'User Register'}" style="color:blue; font-weight:bold;">Register</router-link></p>
									<form action="mail.php" method="post" @submit.prevent="userLogin()">
										<input type="email" v-model="form.email" name="email" placeholder="Email" />
										<span class="text-danger" v-if="errors['email']">{{errors['email'][0]}}</span>
										<input type="password" v-model="form.password" name="password" placeholder="Password" />
										<span class="text-danger" v-if="errors['password']">{{errors['password'][0]}}</span>
										<a v-bind:href="route" style="color:#4d6ee5; font-weight:500; font-size:13px;">Forget your password?</a>
										<div class="submit-text">
										<button type="submit">Login</button>
										</div>
									</form>
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

 export default{
    name: "UserLogin",
    data(){
        return{
			route:'forget-password',
            errors:{},
            form:{              
          }
        }
    },
    methods:{
        userLogin(){
            axios.post('/login', this.form)
            .then((result)=>{
            this.$router.push({name:'User Dashboard'})  
			localStorage.setItem('userLoggedIn', true);
			this.$message({
			message: 'WelCOME to SELL-SHOP!',
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