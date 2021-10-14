<template>
    <div id="public_master">
        <public-header></public-header>
        <public-bread-crum></public-bread-crum>
        <router-view></router-view>
        <public-footer></public-footer>
    </div>
</template>  

<script>
    import PublicHeader from '../public/Inc/PublicHeader.vue'
    import PublicFooter from '../public/Inc/PublicFooter.vue'
    import PublicBreadCrum from '../public/Inc/PublicBreadCrum.vue'
  
     
    export default ({
        name: "PublicMaster",
        components:{
            PublicHeader,
            PublicFooter,
            PublicBreadCrum
        }
    })
</script>