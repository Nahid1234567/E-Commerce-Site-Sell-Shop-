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
                            <h3 class="card-title">Brand List</h3>      
                             <el-button type="primary" @click="BrandCreate" round>Add New</el-button>
                          </div> 
                          <el-button @click="multipleDelete"  v-if="multipleSelection.length>0" type='danger' size="small">Multiple Delete</el-button>
                        </div>
                            <el-table
                            ref="multipleTable"
                            :data="brands.data"
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
                            label="Action"
                            fixed="right">                      
                            <template slot-scope="scope">                          
                            <el-button @click="editBrand(scope.row)" type="text" size="small">Edit</el-button>
                            <el-button  @click="deleteBrand(scope.row.id)" type="text" size="small">Delete</el-button>
                            </template>                        
                            </el-table-column>
                            </el-table>
                            <el-pagination
                            class="text-center"
                            background
                              @current-change="handleCurrentChange"
                              :current-page.sync="currentPage"
                              :page-size="brands.per_page"
                            layout="prev, pager, next"
                            :total="brands.total">
                            </el-pagination>
                     </div>
                  </div>
                </div>
            </div>
        </div>
        <el-dialog
          :title="form.id  ? 'Edit Brand' : 'Add New Brand'"
          :visible.sync="BrandDialog"
          width="50%"
          center>
          <span>
            <el-form label label-width="120x" @submit.prevent="addnewBrand"> 
              <el-form-item label="Brand name">
              <el-input v-model="form.name" placeholder="Brand Name"></el-input>
              <span class="text-danger" v-if="errors['name']">
                {{errors['name'][0]}}
              </span>
              </el-form-item>
            </el-form>
          </span>
          <span slot="footer" class="dialog-footer">
            <el-button @click="brandList">Cancel</el-button>
            <el-button type="primary" v-if ="!form.id" @click="addnewBrand">Save</el-button>
            <el-button type="primary" v-else  @click="updateBrand">Update</el-button>
          </span>
        </el-dialog>
    </div>

</template>

<script>
export default {
    name:"BrandList",
     data() {
      return {
         multipleSelection: [],
         currentPage:1,
         BrandDialog : false,
         form:{
         name: ''
         },
        errors:{},
      }    
      
    },

    methods:{
      multipleDelete(){
        axios.post('/admin/multiple-brand-delete', this.multipleSelection)
         .then((result)=>{
            this.$message({
            message: 'All the Brands Deleted Successfully!',
            type: 'success'
            });
            this.brandList();
        });
    },
      handleCurrentChange(){
        this.$store.dispatch('brand/getBrand', this.currentPage);    
      },
      editBrand(brand){
        this.BrandDialog = true;
        this.form = brand;
      },

      handleClick(){
        console('click');
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
      brandList(){
        this.BrandDialog = false;
        this.$store.dispatch('brand/getBrand', this.currentPage);
      }, 
      BrandCreate(){
        this.BrandDialog = true;
        this.errors = {};
        this.form = {}  
        this.clearData();  
      },
      addnewBrand(){
            axios.post('/admin/brand/', this.form)
            .then((result)=>{
            this.$message({
            message: 'New Brand Added Successfully!',
            type: 'success'
            });
            this.clearData();
            this.brandList();  
            this.BrandDialog = false;
            this.errors = {}     
        })
        .catch((err)=>{
            console.log(err)
            this.errors = err.response.data.errors
        });
        
      },
      updateBrand(){
            axios.put('/admin/brand/'+ this.form.id, this.form)
            .then((result)=>{
            this.$message({
            message: 'Brand Updated Successfully!',
            type: 'success'
            });
            this.clearData();
            this.brandList();  
            this.errors = {}    
            this.BrandDialog = false;
        })
        .catch((err)=>{
            console.log(err)
            this.errors = err.response.data.errors
        });

      },
      deleteBrand(id){
        this.$store.dispatch('brand/deleteBrand', id);  
        this.$message({
        message: 'Brand Deleted Successfully!',
        type: 'success'
        })
      },
      clearData(){
        this.errors = {},
        this.form = {}    
      }
    }, 
    created(){
      this.brandList();
      this.clearData();
      this.errors = {}
    },

computed:{
     brands(){
      return this.$store.getters["brand/getAuthBrand"];     
     }
  } 

}
</script>

<style>

</style>