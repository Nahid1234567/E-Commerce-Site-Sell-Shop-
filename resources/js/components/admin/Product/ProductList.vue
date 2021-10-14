import axios from 'axios'
<template>

  <div class="content-wrapper">
      <div class="content">
            <div class="container-fluid">
                <div class="row">
                  <div class="col-12">
                    <div class="card">
                        <div class="card-header no-border">
                          <div class="d-flex justify-content-between">
                            <h3 class="card-title">Product List</h3>    
                              <router-link :to ="{name: 'AddOrUpdateProduct'}">
                                 <button class="btn btn-info">Add New Product</button> 
                              </router-link>
                          </div> 
                          <el-button @click="multipleDelete"  v-if="multipleSelection.length>0" type='danger' size="small">Multiple Delete</el-button>
                        </div>
                            <el-table
                            ref="multipleTable"
                            :data="products.data"
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
                            property="price"
                            label="Price"
                            width="120">
                            </el-table-column>
                            <el-table-column
                            property="quantity"
                            label="Quantity"
                            width="120">
                            </el-table-column>
                            <el-table-column
                            property="category_id"
                            label="Category"
                            width="120">
                            <template slot-scope="scope">{{scope.row.category.name}}</template>
                            </el-table-column>
                            <el-table-column
                            label="Brand"
                            width="120">
                            <template slot-scope="scope">{{scope.row.brand.name}}</template>
                            </el-table-column>
                            <el-table-column
                            label="Action"
                            fixed="right">                      
                            <template slot-scope="scope">      
                            <el-button  @click.prevent="productDetails(scope.row)" type="text" size="small">Details</el-button> &nbsp;&nbsp;                    
                            <router-link :to ="{name: 'EditProduct', params:{productId: scope.row.id}}">Edit</router-link> &nbsp; &nbsp;  
                            <el-button  @click="deleteProduct(scope.row.id)" type="text" size="small">Delete</el-button>                            
                            </template>                        
                            </el-table-column>
                            </el-table>
                            <el-pagination
                            class="text-center"
                            background
                              @current-change="handleCurrentChange"
                              :current-page.sync="currentPage"
                              :page-size="products.per_page"
                            layout="prev, pager, next"
                            :total="products.total">
                            </el-pagination>
                     </div>
                  </div>
                </div>
            </div>
        </div>
        <el-dialog
          :title="single_product.name"
          :visible.sync="productDialogVisible"
          width="50%"
          center>
          <span>
            <h5 v-if="single_product.category">Category Name: {{single_product.category.name}}</h5>
            <h5 v-if="single_product.brand">Brand Name: {{single_product.brand.name}}</h5>
            <p><b>Description:</b> {{single_product.description}}</p><br>
            <p><b>Price:</b> {{single_product.price}}</p><br>
            <p><b>Quantity:</b> {{single_product.quantity}}</p><br>
            <b>Image:</b> <img :src="`/uploads/${single_product.image}`" width="100px"/><br>
            <b>Size:</b> <p v-for="(size ,index) in single_product.size" :key="index">
              {{size}},
            </p><br>
            <b>Color:</b> <p v-for="(color , index) in single_product.color" :key="color">
              <input type ="color" :value="color"/>,
            </p>
          </span>
        </el-dialog>
  </div>
   

</template>

<script>
export default {
    name:"ProductList",

     data() {
      return {
        productDialogVisible: false,
        product:{},
        currentPage:1,      
         form:{         
                  
         },
        multipleSelection: [],
        errors:{},
      }
    },

    methods: {
      
       multipleDelete(){
        axios.post('/admin/multiple-product-delete', this.multipleSelection)
         .then((result)=>{
            this.$message({
            message: 'All the Products Deleted Successfully!',
            type: 'success'
            });
            this.productList();
        });
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handleClick(){

      },
      productDetails(row){
        this.product = row;
        this.productDialogVisible = true;
      },
      toggleSelection(rows) {
        if (rows) {
          rows.forEach(row => {
            this.$refs.multipleTable.toggleRowSelection(row);
          });
        } else {
          this.$refs.multipleTable.clearSelection();
        }
      },
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handleCurrentChange(){
        this.$store.dispatch('product/getProduct', this.currentPage);    
      },
      productList(){
        this.productDialogVisible = false;
        this.$store.dispatch('product/getProduct', this.currentPage);
      },
      deleteProduct(id){
        this.$store.dispatch('product/deleteProduct', id);  
        this.$message({
        message: 'Product Deleted Successfully!',
        type: 'success'
        })
      }
    }, 
    created(){
      this.productList();
    },
    computed:{
      products(){
        return this.$store.getters["product/getAuthProduct"];
      },
       single_product(){
        return this.$store.getters["product/getSingleProduct"];
      }
    }

}
</script>

<style>

</style>