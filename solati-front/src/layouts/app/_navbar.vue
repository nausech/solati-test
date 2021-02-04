<template>
  
  <div>

    <header class="navbar navbar-expand navbar-dark flex-column flex-md-row bd-navbar bg-gradient-x-grey-blue">
        <a class="cursor-pointer" @click="toggleSidebar"  >
            <span v-show="!showleftSideMenu" style="color: #FFFFFF !important;" class="mdi-28px mdi mdi-menu"></span>
            <span v-show="showleftSideMenu" style="color: #FFFFFF !important;" class="mdi-28px mdi mdi-close"></span>  
        </a>

        <div class="navbar-nav-scroll">
            <ul class="navbar-nav bd-navbar-nav flex-row">
            <li class="nav-item">               
                <h4 style="color: #FFFFFF !important;margin: .5rem" class="text-dark page-title" >{{ $t($route.name) }}</h4>   
            </li>
            
            </ul>
        </div>

        <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">

             <li class="nav-item mr-2 ml-2">
                <h5 style="color: #FFFFFF !important;" class="pt-1">{{ authUser.name }}</h5>
            </li>
            
            <li class="nav-item dropdown pt-1 pr-0 ml-3">
                <a @click="showAppsMenuToggle()" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="cursor-pointer">
                   
                    <div style="color: #FFFFFF !important;" class="mdi mdi-28px mdi-apps"></div>
                </a>
            </li>
        </ul>
    </header>

    <transition name="fade" mode="out-in">
        <div  v-if="showleftSideMenu" class="overlay">
        </div>
    </transition>

    <transition name="slide">
        <div v-if="showleftSideMenu" style="z-index: 2000000;" class="menu-fixed-collapsed main-menu menu-fixed menu-light menu-accordion menu-shadow">
            <div class="main-menu-content ps-container ps-theme-dark ps-active-y">

                <ul class="navigation navigation-main">
                   
                    <template v-for="item in menuItems" >
                        
                        <template v-if="userCan(item.roles)">
                            
                            <li :key="item.id" :class="{'open':ItemSelected === item.id}" class="nav-item has-sub">
                                
                                <a :class="{'active': $route.name === item.routeName}" class="nav-link cursor-pointer" @click.prevent="redirect(item)">
                                    
                                    <div  class="row">
                                        <div class="col-2">
                                            <span :class="item.iconClass"></span>                                            
                                        </div>
                                        <div class="col-10">
                                            <span style="line-height: 40px;vertical-align: middle;" v-show="showleftSideMenu" class="menu-title">{{ $t(`${item.text}`) }}</span>
                                        </div>
                                    </div>
                                </a>
                                


                            </li>
                        </template>
                    </template>
                </ul>
            </div>
        </div>
    </transition>
    
    <MenuApp ></MenuApp>
    

  </div>
</template>

<script>


import { mapState } from 'vuex'
import MenuApp from '@/components/MenuApp'

export default {
    components:{
        MenuApp
    },    
    data () {
        return {
            ItemSelected:null,	        
            userScopes :[],	        
            topMenuItems:[],            
            showModal:false,            
        }
    },
    created(){        
        
        const menu = (!this.$route.meta.menu ? this.$store.state.leftMenuItems.menuDefault: this.$route.meta.menu)
        this.$store.dispatch('leftMenuItems/setMenuItems',menu)
    },
    watch:{
        $route (to, from){
            
            const menu = (!to.meta.menu ? this.$store.state.leftMenuItems.menuDefault: to.meta.menu)

            this.$store.dispatch('leftMenuItems/setMenuItems',menu)
        }
    },
    computed:{                
        ...mapState(['authUser','showleftSideMenu','leftMenuItems']),
        menuItems(){
            

            const find = this.leftMenuItems.menuItems.filter((menu) => {
                return (menu.id == 0)
            })

            const items =  this.leftMenuItems.menuItems

            if (find.length == 0){
                items.push({id:0,
                    routeName:null,
                    text:'Logout',
                    action: () => {
                        return this.goLogout()
                    },
                    roles:['all'],                    
                    iconClass:'nav-bar-icon mr-2 mdi-28px mdi mdi-power'
                })
            }
            
            return items
        }
    },
    methods:{      
        toggleSidebar(){
            this.$store.dispatch('showleftSideMenuToggle',!this.showleftSideMenu)
        },
        toggleModal(){
            
            this.showModal = !this.showModal
        },
        showAppsMenuToggle(){                 
            
            this.$store.dispatch('showleftSideMenuToggle',false)
            this.$store.dispatch('modals/showModalToggle','MenuApp')
            
        },
        notify(){            
            this.$notify.success('Your custom message', {
                position:'top'
            })
        },        
        goLogout(){
            this.$store.dispatch('logOut')
        },
        userCan(roles){
            return true
        },        
        redirect(item){
            
            if (item.action != undefined){
                item.action(item)
            }
            else if (item.routeName){
                this.$router.push({name:item.routeName})
            }

            this.toggleSidebar()

        },
       
    }
}
</script>
 
<style>
.badge-shadow{
    box-shadow: 0 0 10px #ff4961 !important;
}
.badge-pill{
    font-weight: 400;line-height: 1;display: inline-block;
    padding: .35em .4em;
    font-size: 80%;
    text-align: center;
    font-weight: 600;
    vertical-align: baseline;
    border-radius: .25rem;
    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;padding-right: .6em;
    padding-left: .6em;
    border-radius: 10rem;position: absolute;top: 0px;right: -9px;
}
.fade-enter-active {
  transition: opacity 0.3s ease-in-out;
}
.fade-enter-to{
  opacity: 1;
}
.fade-enter{
  opacity: 0;
}

.slide-enter-active,
.slide-leave-active
    {
        transition: transform 0.2s ease;
    }

    .slide-enter,
    .slide-leave-to {
        transform: translateX(-100%);
        transition: all 150ms ease-in 0s
    }

    .sidebar-backdrop {
        background-color: rgba(19, 15, 64, .4);
        width: 100vw;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        cursor: pointer;
    }

    .sidebar-panel {
        overflow-y: auto;
        background-color: #130f40;
        position: fixed;
        left: 0;
        top: 0;
        height: 100vh;
        z-index: 999;
        padding: 3rem 20px 2rem 20px;
        width: 300px;
}
.overlay{
    z-index: 1000000;
    position: fixed;        
    width: 100%;
    height: 100%;
    top: 68px;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: rgba(0,0,0,0.5); 
}

.has-sub .nav-link{
 
    border-bottom: 1px #ececec solid !important;

}
.content-wrapper {
    /*margin-top: 59px !important;*/
}

a.nav-link .active{
    color: #ffffff !important;
}

.header-navbar .navbar-container ul.nav li > a.nav-link {
    padding: 10px !important;
}

.nav-bar-icon{
    font-size: 16px !important;
}

.main-menu.menu-light .navigation>li.open{
    border-left: 4px solid #473580;
}

.left-menu{
    transition: all 600ms ease-out;
    display: none;
}

a.menu-item {
    font-size: 18px;
}

.menu-item-top{
    color: #404E67 !important;
    font-size: 14px !important;
    
}
.left-menu-collapsed{
    display: block;
}

span.menu-title{    
    font-size: 18px;
    font-weight: 600;
    
}
.menu-accordion{
    width: 0;
    position: fixed;
    left: 0;
    top: 68px;
    display: table-cell;
}
.menu-collapsed{
    margin-left: -260px;
}
.badge.badge.float-right {
    margin-left: .5rem !important;
    margin-top: .17rem !important;
}

.main-menu.menu-light .navigation>li.open>a {
    color: #fff !important;
    background:  #43882a !important;
}
.main-menu.menu-light .navigation>li ul li>a {
    padding: 10px 18px 10px 50px !important;
}
.main-menu.menu-light .navigation>li ul .active>a {
    font-weight: 500 !important;
}
.main-menu.menu-light .navigation>li .active>a {
    font-weight: 500;
}
.main-menu.menu-light .navigation>li ul .active {
    background: 0 0 !important;
}
.main-menu.menu-light .navigation>li ul li {
    color: #404E67 !important;
    background: 0 0 !important;
}
.navigation li {
    position: relative !important;
    white-space: nowrap !important;
}
.main-menu.menu-light .navigation>li ul {
    padding: 0 !important;
    margin: 0 !important;
    font-size: 0.9rem !important;
}
.main-menu ul {
    list-style: none !important;
    margin: 0 !important;
    padding: 0 !important;
}
.main-menu.menu-light .navigation>li.open {
    border-left: 4px solid #FFFFFF !important;
}
.main-menu.menu-light .navigation>li>a {
    padding: 10px 30px 10px 14px !important;
}
.main-menu.menu-light .navigation li a {
    color: #343a40 !important;
}
.navigation li a {
    display: block !important;
    text-overflow: ellipsis !important;
    overflow: hidden !important;
    border-left: 4px solid transparent !important;
}

.main-menu a {
    outline: 0 !important;
}
.navigation .navigation-header {
    font-weight: 400 !important;
    line-height: 1.2 !important;
    padding: 12px 22px !important;
    font-size: 0.9rem !important;
    text-transform: uppercase !important;
}

.main-menu.menu-light .navigation .navigation-header span{
    font-weight: 500;
}

.navigation, .navigation .navigation-header {
    font-weight: 600;
}

.navigation li {
    position: relative;
    white-space: nowrap;
}

.main-menu.menu-light .navigation {
    background: inherit !important;
}

.main-menu ul.navigation-main {
    overflow-x: hidden;
}
.main-menu ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.navigation {
    font-size: 1rem;
    font-weight: 300;
    overflow-y: hidden;
    padding-bottom: 20px;
}

.navigation, .navigation .navigation-header {
    font-size: 18px !important;
}

.main-menu .main-menu-content {
    height: 100%;
    position: relative;
}
.ps-theme-dark {
    -ms-touch-action: none;
    touch-action: none;
    overflow: hidden!important;
    -ms-overflow-style: none;
}
.ps-container {
    -ms-touch-action: none;
    touch-action: none;
    overflow: hidden!important;
    -ms-overflow-style: none;
}
.main-menu.menu-shadow {
    -webkit-box-shadow: 1px 0 20px rgba(0,0,0,.1);
    box-shadow: 1px 0 20px rgba(0,0,0,.1);
}

.menu-fixed-collapsed{
    width: 320px !important;
}
.main-menu.menu-fixed {
    position: fixed;    
    height: -webkit-calc(100%);
    height: -moz-calc(100%);
    height: calc(100%);
}
.main-menu.menu-light {
    color: #343a40;
    background: #ffffff;
    
}
.main-menu {
    z-index: 1000;
    position: absolute;
    display: table-cell;
}
body.vertical-layout.vertical-menu.menu-expanded .main-menu {
    width: 240px;
    -webkit-transition: .3s ease all;
    -o-transition: .3s ease all;
    -moz-transition: .3s ease all;
    transition: .3s ease all;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    backface-visibility: hidden;
}
.header-navbar .navbar-wrapper{
    width: 100%
}
.header-navbar .navbar-header .navbar-brand .brand-text {
    display: inline;
    padding-left: 10px;
    font-weight: 500;
    letter-spacing: 1px;
}
body.vertical-layout.vertical-menu .navbar .navbar-brand {
    white-space: nowrap;
}

.navbar-brand {
    display: inline-block;
    padding-top: .31875rem;
    padding-bottom: .31875rem;
    margin-right: 1rem;
    font-size: 1.35rem;
    line-height: inherit;
}
.header-navbar .nav-item+.nav-item, .header-navbar.navbar-without-menu .navbar-container {
    margin-left: 0;    
}
.flex-row {
    -webkit-box-orient: horizontal!important;
    -webkit-box-direction: normal!important;
    -webkit-flex-direction: row!important;
    -moz-box-orient: horizontal!important;
    -ms-flex-direction: row!important;
    flex-direction: row!important;
}
body.vertical-layout.vertical-menu.menu-expanded .navbar .navbar-header {
    float: left;
    width: 240px;
}
.header-navbar .navbar-header {
    width: 240px;
    height: 59px;
    float: left;
    position: relative;    
    transition: .3s ease all;
}
ul{
  list-style: none;
  padding-inline-start: 0px !important;
}
.bg-gradient-x-grey-blue{
    background-color: #01274C !important
}

.dropdown-item{
    color: #404E67 !important;
    display: block;
    width: 100%;
    padding: 0.25rem 1.5rem;
    clear: both;
    font-weight: 400;
    color: #212529;
    text-align: inherit;
    white-space: nowrap;
    background-color: transparent;
    border: 0;
}

.logout-button {
    border: none !important;
    outline: none !important;
    background-color: transparent !important;
}

.dropdown-item.active, .dropdown-item:active{
    background-color: transparent !important;
}

@media 
only screen and (max-width: 778px),
(min-device-width: 768px) and (max-device-width: 937px)  {
    .menu-fixed-collapsed {
        width: 100% !important;
    }   
}
</style>

