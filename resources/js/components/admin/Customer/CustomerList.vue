<template>

    <div class="content-wrapper">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                  <div class="col-12">
                    <div class="card">
                        <div class="card-header no-border">
                          <div class="d-flex justify-content-between">
                            <h3 class="card-title">Customer List</h3>
                             <el-button type="primary" round>Add New</el-button>
                          </div> 
                        </div>
                        <el-table
                            ref="multipleTable"
                            :data="customers.data"
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
                            property="name"
                            label="Name"
                            width="120">
                            </el-table-column>
                            <el-table-column
                            fixed="right"
                            property="email"
                            label="Email"
                            show-overflow-tooltip>
                            </el-table-column>
                            <el-table-column
                            fixed="right"
                            label="Action">
                            <template slot-scope="scope">   
                            <el-button @click="editCategory(scope.row)" type="text" size="small">Details</el-button>
                            <el-button @click="editCategory(scope.row)" type="text" size="small">Edit</el-button>
                            <el-button  @click="deleteCategory(scope.row.id)" type="text" size="small">Delete</el-button>                       
                            </template>                        
                            </el-table-column>
                            </el-table>
                            <el-pagination
                            class="text-center"
                            background
                              @current-change="handleCurrentChange"
                              :current-page.sync="currentPage"
                              :page-size="customers.per_page"
                            layout="prev, pager, next"
                            :total="customers.total">
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
    name:"CustomerList",
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
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handleClick(){

      },
      handleCurrentChange(){
        this.$store.dispatch('user/userList', this.currentPage);    
      },
      customerList(){
        this.$store.dispatch('user/userList');
      }
    }, 
    created(){
      this.customerList();
    },
    computed:{
      customers(){
       return this.$store.getters["user/userList"];
      }
    }

}
</script>

<style>

</style>