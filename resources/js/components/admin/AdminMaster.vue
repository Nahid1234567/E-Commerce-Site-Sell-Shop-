<template>
    <div  id="admin_master">
        <div class="wrapper">
            <template  v-if="$route.name !== 'AdminLogin'">
                <admin-header ></admin-header>  
                <admin-sidebar></admin-sidebar>
            </template>
            <router-view></router-view>
            <admin-footer v-if="$route.name !== 'AdminLogin'"></admin-footer>
        </div>
    </div>
</template>

<script>
    import AdminHeader from '../admin/Inc/AdminHeader.vue'
    import AdminSidebar from '../admin/Inc/AdminSidebar.vue'
    import AdminFooter from '../admin/Inc/AdminFooter.vue'
    
    export default ({
        name:"AdminMaster",
         components:{
            AdminHeader,
            AdminSidebar,
            AdminFooter
        }
    })

</script>
