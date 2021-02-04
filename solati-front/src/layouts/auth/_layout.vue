<template>
    <div :style="`background-image: url(${require('@/assets/img/xbanner,P201.jpg.pagespeed.ic.3PsnKK_62Q.webp')});`" class="full-screen auth-screen container-fluid">
        <transition name="fade" mode="out-in">
            <router-view></router-view>
        </transition>
    </div>
</template>

<script>

export default {}

</script>
<style scope>

.auth-screen{
    /*background: rgb(201,112,16);*/
    
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}

</style>
