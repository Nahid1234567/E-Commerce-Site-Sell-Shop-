<template>
  <div class="content-wrapper">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                  <div class="col-12">
                        <router-link :to ="{name: 'Shop'}">
                          <button class="btn btn-primary" style="float:right; border-radious:1px; margin-right:15px;">Add New Order</button> 
                        </router-link>
                      <div class="card" v-if="orders.total > 0">
                        <div class="card-header no-border">
                          <div class="d-flex justify-content-center">
                            <h3 class="card-title text-center">Order List</h3>
                          </div> 
                           <!-- <el-button @click="multipleDelete" style="margin-left:10px;" v-if="multipleSelection.length>0" type='danger' size="small">Multiple Delete</el-button> -->
                      </div>                      
                        <el-table
                            ref="multipleTable"
                            :data="orders.data"
                            style="width: 100%">
                            <el-table-column
                            type="selection"
                            width="55">
                            </el-table-column>
                            <el-table-column
                            label="Date"
                            width="120">
                            <template slot-scope="scope">{{ scope.row.created_at | timeformat }}</template>
                            </el-table-column>
                            <el-table-column
                            fixed="right"
                            property="payment_type"
                            label="Payment Type"
                            width="120">
                            </el-table-column>
                            <el-table-column
                            fixed="right"
                            property="total"
                            label="Total"
                            show-overflow-tooltip>
                            </el-table-column>
                            <el-table-column
                            fixed="right"
                            property="status"
                            label="Status"
                            show-overflow-tooltip>
                            </el-table-column>
                            <el-table-column
                            fixed="right"
                            label="Action">
                            <template slot-scope="scope">   
                            <el-button @click="orderDetails(scope.row.id)" type="text" size="small">Details</el-button>
                            <!-- <el-button @click="deleteOrder(scope.row.id)" type="text" size="small">Delete</el-button> -->
                            <!-- <el-button @click="editCategory(scope.row)" type="text" size="small">Edit</el-button>
                            <el-button  @click="deleteCategory(scope.row.id)" type="text" size="small">Delete</el-button>                        -->
                            </template>                        
                            </el-table-column>
                        </el-table>
                            <el-pagination
                              class="text-center"
                              background
                                @current-change="handleCurrentChange"
                                :current-page.sync="currentPage"
                                :page-size="orders.per_page"
                              layout="prev, pager, next"
                              :total="orders.total">
                            </el-pagination>
                      </div>
                    <div v-else>
                      <span style="margin-left: 400px; font-size: 26px; color:#138d65; font-family:-webkit-body; font-weight:bold;">WelCome! To Your Dashdoard | Place Your First Order</span>
                    </div>
                  </div>
                </div>
            </div>
        </div>
  </div>

</template>

<script>
export default {
    name:"UserDashboard",
     data() {
      return {

        currentPage:1,      
        multipleSelection: [],
        //  form:{
        //   name: '',
        //   email:''
        //  },
      }
    },
    computed:{
      user(){
        return this.$store.getters['user/getAuthUser']
      },
      orders(){
        return this.$store.getters["order/getAllOrders"];
      }
    },
    methods:{
      //  multipleDelete(){
      //   axios.post('/user/multiple-order-delete', this.multipleSelection)
      //    .then((result)=>{
      //       this.$message({
      //       message: 'All the Orders Deleted Successfully!',
      //       type: 'success'
      //       });
      //       this.orderList();
      //   });
      // },
      getUser(){
       this.$store.dispatch('user/getUser');
      },
      orderDetails(id){      
        this.$router.push({name: 'User Order Details', params:{orderId: id}});
      },
      handleCurrentChange(){
        this.$store.dispatch('order/getOrder', this.currentPage);    
      },
      orderList(){
        this.$store.dispatch('order/getOrder', this.currentPage);
      },
      // deleteOrder(id){
      //   this.$store.dispatch('order/userDeleteOrder', id);  
      //   this.$message({
      //   message: 'Order Deleted Successfully!',
      //   type: 'success'
      //   })
      //   this.orderList();
      // }
    },
    created(){
      this.getUser();
      this.orderList();
    }
}
</script>
