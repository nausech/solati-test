<template>
    <div  class="w-100">
        
        <div class="col-12">                  
            <h5 class="page-title order-title">{{ $t("Order") }} #{{ order.id }} 
            
            <small v-show="order.status_id == 1" class="h6 text-muted float-right">{{ order.date_time | fromNow }}</small>    
            
            <small v-show="order.status_id == 6 && order.distributor" class="h6 text-muted float-right">{{ order.delivered_time }} min</small>
            
            </h5>
        </div>

        <div class="col-12">
            <div class="row">
                <div class="col-12">
                    <small class="h6">{{ order.items.length }} items </small>
                    <small class="ml-2 h6 text-muted">{{ order.total_amount | formatNumber }} $</small>                    
                    <span v-show="order.status_id == 6 && order.distributor"  class="float-right text-primary nav-bar-icon mdi mdi-18px mdi-bike-fast"></span>
                </div>

                
            </div>   
        </div>
        
    </div>
</template>

<script>

export default {
    name: 'orderItem',
    data(){
        return { }
    },
    props: {
        order: {
            type: Object,
            required: true
        }
    },    
    methods: {

    }
}
</script>

<style scoped>

</style>