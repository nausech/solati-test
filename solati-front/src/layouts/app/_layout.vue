<template>
    <div>
        
        <div style="background-color: #f4f5fa;" class="app-content content">
            <navbar></navbar>  
            
            <div class="content-wrapper">            
                
                <transition name="fade" mode="out-in">
                    <router-view></router-view>
                </transition>
                        
            </div>

        </div>

        <Modal v-if="showModalNewOrder">
        
            <template slot="title">      
                {{ $t('You have a new order') }}
            </template>

            <template slot="top">      
                
                <button style="right:0;z-index: 5;"  type="button" @click="showToggleModalNewOrder" class="close float-right" aria-label="close">
                    <span class="mdi-28px mdi mdi-close-circle"></span>
                </button>              
                
            </template>
            <div slot="body">                    
                <div class="row text-center mb-3">

                    <div class="col-12">                        
                        
                        
                        <h5 class="page-title">{{ newOrderComming.total_amount | formatNumber }} $ <br>

                        
                            <small v-if="newOrderComming.items" class="h6 text-muted">{{ newOrderComming.items.length }} items</small>                                      
                        </h5>
                         
                    </div>
                    <div class="col-12">
                        
            
                        <span class="text-success mdi mdi-38px mdi-cart-outline"></span>
                        
                    </div>

                    <div class="col-12 mt-3">
                        <button @click="showOrder()" class="btn btn-success">{{ $t('View order') }}</button>
                    </div>

                    <div v-show="ordersPending.length > 0" class="col-12 mt-3">
                        <small  class="h6 text-muted">
                            <span class="text-danger mdi mdi-alert"></span>
                            Tiene {{ ordersPending.length-1 }} ordenes pendientes</small>                                      
                    </div>
                    
                </div>
            </div>
        </Modal>
    </div>
</template>

<script>

import navbar from './_navbar'
import { mapState } from 'vuex'
import Modal from '@/components/Modal'

export default {
    data(){
        return {
            newOrderComming:{}
        }
    },
    components: {
        navbar,Modal
    },    
    computed:{
        ...mapState(['ordersPending','ordersAccepted','showModalNewOrder']),
        showSidebar(){
            return this.$store.state.showSidebar
        }
    },
    methods:{
        showToggleModalNewOrder(){
            this.$store.commit('SET_TOGGLE_MODAL_NEW_ORDER',false)
        },
        showOrder(){
            this.$store.commit('SET_CURRENT_ORDER_SHOW',this.newOrderComming)
            this.$store.commit('SET_TOGGLE_MODAL_NEW_ORDER',false)
        }
    }
}

</script>

<style scope>

/*
.content-menu-collapsed{
    margin-left:260px;
}
*/

.breadcrumbs-top .breadcrumb {
    margin: 0;
    padding: 0;
}
.breadcrumb {
    font-size: .8rem !important;
    padding: 0 0 .75rem;
}
.breadcrumb, .card-transparent {
    background-color: #f5f7fa;
}

.breadcrumb, .card .card-title, .dropdown-header {
    text-transform: uppercase;
}


.mb-2, .my-2 {
    margin-bottom: 1.5rem!important;
}
</style>