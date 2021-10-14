<template>
    <div class="container col-6">
        <form @submit.prevent="handleSubmit">
            <h3>Reset Password</h3>
            <div class="form-group">
                <label>Password</label>  
                <input type="password" class="form-control" v-model="password" placeholder="Password" />
            </div>
            <div class="form-group">
                <label>Confirm Password</label>  
                <input type="password" class="form-control" v-model="password_confirm" placeholder="Confirm Password" />
            </div><br>

            <button class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>
</template>

<script>
import axios from 'axios'
 
export default {
    name:"Reset",
      data(){
       return{
          password:'',
          password_confim:''
       }
     },
     methods:{
         async handleSubmit(){
             const response = await axios.post('reset',{
                 password: this.password,
                 password_confim: this.password_confim,
                 token: this.$route.params.token
             });
            this.$router.push({name: 'User Login'})
         }
     }
}
</script>

<style>

</style>