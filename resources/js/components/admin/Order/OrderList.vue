<template>

    <div class="content-wrapper">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                  <div class="col-12">
                    <div class="card">
                        <div class="card-header no-border">
                          <div class="d-flex justify-content-between">
                            <h3 class="card-title">Order List</h3>
                          </div><br>
                          <el-button @click="multipleDelete" v-if="multipleSelection.length>0" type='danger' size="small">Multiple Delete</el-button>
                        </div>
                        <el-table
                            ref="multipleTable"
                            :data="orders.data"
                            style="width: 100%"
                            @selection-change="handleSelectionChange">
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
                            <el-button @click="deleteOrder(scope.row.id)" type="text" size="small">Delete</el-button>
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
                  </div>
                </div>
            </div>
        </div>
    </div>

</template>

<script>
export default {
    name:"OrderList",
     data() {
      return {
        currentPage:1,      
         multipleSelection: [],
         form:{
          name: '',
          email:''
         },
      }
    },

    methods: {
       multipleDelete(){
        axios.post('/admin/multiple-order-delete', this.multipleSelection)
         .then((result)=>{
            this.$message({
            message: 'All the Orders Deleted Successfully!',
            type: 'success'
            });
            this.orderList();
        });
      },
      getAdmin(){
        this.$store.dispatch('admin/getAdmin');
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      orderDetails(id){      
        this.$router.push({name: 'Order Details', params:{orderId: id}});
      },
      handleCurrentChange(){
        this.$store.dispatch('order/usergetOrder', this.currentPage);    
      },
      orderList(){
        this.$store.dispatch('order/usergetOrder', this.currentPage);
      },
      deleteOrder(id){
        this.$store.dispatch('order/deleteOrder', id);  
        this.$message({
        message: 'Order Deleted Successfully!',
        type: 'success'
        })
        this.orderList();
      }
    }, 
    created(){
      this.orderList();
      this.getAdmin();
    },
    computed:{
      orders(){
        return this.$store.getters["order/getAllOrders"];
      }
    }

}
</script>

<style>

</style>