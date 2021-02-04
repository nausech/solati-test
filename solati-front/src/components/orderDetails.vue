<template>
    <div>

       
        <div class="row pt-3">
            <div class="col-12">
                <h5 class="page-title order-title">{{ $t("Details") }}</h5>
            </div>
        </div>
                
                
        
        <div class="row ">
            <div class="col-12">
                
                    <div :key="index" v-for="(item,index) in order.items" class="row pb-2 pt-2 border-bottom">
                        <div class="col-6">
                            
                            <div class="row">
                                <div class="col">
                                    {{ item.product.name }}
                                </div>
                            </div>

                            
                            <div v-show="item.customer_instructions.length > 0" class="row">
                                <div class="col-12">
                                    <small class="text-muted">{{ $t("Instructions") }}</small>
                                </div>
                            </div>  
                            
                            
                            <div class="row">
                                <div class="col-12">
                                    <small class="text-muted">{{ item.customer_instructions }}</small>
                                </div>
                            </div>  
                            
                            
                        </div>                        
                        
                        
                        <div class="col-3">

                            
                            <div v-show="item.aditionals.length > 0" class="row">
                                <div class="col">
                                    Adicionales  
                                </div>
                            </div>
                            
                            
                            <div v-show="item.aditionals.length > 0" :key="index" v-for="(aditional,index) in item.aditionals" class="row">
                                <div class="col-12">
                                    <small class="text-muted">{{ aditional.aditional.name }}</small>
                                </div>
                            </div>  
                            
                        
                        </div>                        
                        

                        <div class="col-3"> <span class="float-right"> {{ item.unit_price | formatNumber }} $</span></div>
                    </div>

                    
                    <div  class="row pb-2 pt-3">
                        <div class="col-6">
                            <h5 class="page-title order-title">Sub total</h5>
                        </div>
                        <div class="col-6"> <span class="float-right"><h5 class="page-title order-title">50,000 $</h5></span></div>                        
                    </div>
                    <div  class="row pb-2 pt-3">
                        <div class="col-6">
                            <h5 class="page-title order-title">IVA 16%</h5>
                        </div>
                        <div class="col-6"> <span class="float-right"><h5 class="page-title order-title">2,000 $</h5></span></div>                        
                    </div>
                    <div  class="row pb-2 pt-2">
                        <div class="col-6">
                            <h5 class="page-title order-title">Total</h5>
                        </div>
                        <div class="col-6"> <span class="float-right"><h5 class="page-title order-title">{{ order.total_amount | formatNumber }} $</h5></span></div>                        
                    </div>
                    
                    
                
            </div>
        </div>
        
    </div>
</template>

<script>


export default {
    name: 'orderDetails',    
    props: {
        order: {
            type: Object,
            required: true    
        }
    }
}
</script>

<style scoped>



</style>