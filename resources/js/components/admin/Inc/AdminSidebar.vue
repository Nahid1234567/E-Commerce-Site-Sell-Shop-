<template>
   <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="index3.html" class="brand-link">
            <!-- <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                style="opacity: .8"> -->
            <span class="brand-text font-weight-light">Admin Dashboard</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                <a href="#" class="d-block">{{admin.name}}</a>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                    with font-awesome or any other icon font library -->
                    <li class="nav-item has-treeview menu-open">
                        <a href="#" class="nav-link active">
                              <i class="fas fa-tachometer-alt"></i>&nbsp;
                            <p>
                                Dashboard
                            </p>
                        </a>
                    </li>
                    <li class="nav-item has-treeview menu-open">
                       <router-link :to="{name:'ProductList'}" class="nav-link">
                              <i class="fab fa-product-hunt"></i>&nbsp;
                            <p>
                                Products
                            </p>
                        </router-link>
                    </li> 
                    <li class="nav-item has-treeview menu-open">
                       <router-link :to="{name:'BrandList'}" class="nav-link">
                              <i class="fas fa-tachometer-alt"></i>&nbsp;
                            <p>
                                Brands
                            </p>
                        </router-link>
                    </li> 
                    <li class="nav-item has-treeview menu-open">
                       <router-link :to="{name:'CategoryList'}" class="nav-link">
                              <i class="fas fa-tachometer-alt"></i>&nbsp;
                            <p>
                                Categories
                            </p>
                        </router-link>
                    </li> 
                    <li class="nav-item has-treeview menu-open">
                       <router-link :to="{name:'OrderList'}" class="nav-link">
                              <i class="fas fa-tachometer-alt"></i>&nbsp;
                            <p>
                                Orders
                            </p>
                        </router-link>
                    </li> 
                     <li class="nav-item has-treeview menu-open">
                       <router-link :to="{name:'CustomerList'}" class="nav-link">
                              <i class="fas fa-tachometer-alt"></i>&nbsp;
                            <p>
                                Customers
                            </p>
                        </router-link>
                    </li> 
                    <li class="nav-item has-treeview menu-open">
                          <a href="" class="nav-link" @click.prevent="logout()">
                               <i class="fas fa-sign-out-alt"></i>&nbsp;
                            <p>
                                Logout
                            </p>
                        </a>
                    </li>   
                    <li class="nav-item has-treeview menu-open">                      
                        <a class="nav-link" v-bind:href="route">
                          <i class="fas fa-tachometer-alt"></i>&nbsp;
                            Change Password
                        </a>											
                    </li>   
                    
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>
</template>

<script>
    
    export default ({
        name:"AdminSidebar",
        data() {
			return {
				route:'change-admin-password'
			}
		},
        computed:{
		    admin(){
			    return this.$store.getters['admin/getAuthAdmin'];
			}
        },
        methods:{
            getAdmin(){
				this.$store.dispatch('admin/getAdmin');
			},
            logout(){
                axios.post('/logout')
                .then(res=>{
                localStorage.removeItem('adminLoggedIn')
                this.$router.push({name:'AdminLogin'})
                this.$message({
                message: 'You Have Been Logged Out!',
                type: 'success'
                });
            })
      
          }
        },
        created(){
		    this.getAdmin();
		}
    })
</script>
 