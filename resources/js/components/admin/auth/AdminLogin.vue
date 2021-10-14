
import Axios from 'axios'
<template>

 <div id= "admin_login" class="hold-transition login-page"> 
  <body class="hold-transition login-page">
   <div class="login-box">
    <div class="login-logo">
        <a href="#">Admin <b>Login</b></a>
    </div>
    <!-- /.login-logo -->
    <div class="card">
        <div class="card-body login-card-body">
        <p class="login-box-msg">Sign in to start your session</p>
        <form action= "mail.php" method="post" @submit.prevent="adminLogin()">
            <div class="form-group has-feedback">
                <input type="email" class="form-control"  v-model="form.email" placeholder="Email">
                <span class="fa fa-envelope form-control-feedback"></span>
            </div>
            	<span class="text-danger" v-if="errors['email']">{{errors['email'][0]}}</span>
            <div class="form-group has-feedback">
                <input type="password" class="form-control"  v-model="form.password" placeholder="Password">
                <span class="fa fa-lock form-control-feedback"></span>
            </div>
                <span class="text-danger" v-if="errors['password']">{{errors['password'][0]}}</span>
            <div class="row">
                <div class="col-8">
                    <div class="checkbox icheck">
                    <label>
                        <input type="checkbox"> Remember Me
                    </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <!-- /.social-auth-links -->

        <p class="mb-1">
            <!-- <a v-bind:href="route">@{{password.request}}Forgot password?</a> -->
        </p>
        <br>
        <!-- <p class="mb-0">
            <a href="register.html" class="text-center">Register a new membership</a>
        </p> -->
        </div>
        <!-- /.login-card-body -->
    </div>
    </div>
 </body>
    <!-- /.login-box -->
</div>

</template>

<script>
export default {
     name:"AdminLogin",

     data(){
         return{
             errors:{},
             form:{
                 email:'',
                 password:''
             }
         }

     },
     methods:{
         adminLogin(){
            axios.post('/admin/login', this.form)
            .then(res=>{
			localStorage.setItem('adminLoggedIn', JSON.stringify(res.data));
            this.$router.push({name:'AdminDashboard'})
			this.$message({
			message: 'WelCOME To DashBoard!.',
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


<style>

</style>