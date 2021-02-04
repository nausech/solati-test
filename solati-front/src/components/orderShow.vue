<template>
    <div>
      
        <template v-if="loading">    
            <loading></loading>
        </template>
    
        <template v-else>         
            
            <div id="order-box" v-show="order" class="ml-0 mt-3 mr-3 pl-3 pt-3 pr-3 border-top border-left rounded">
            
                <template v-if="order.status_id == 1">
                    <div class="row border-bottom">
                        <div class="col-12">
                            <h5 class="page-title">{{ $t("Order") }} #{{ order.id }} <br>
                                <small class="h6">{{ `${order.customer.first_name} ${order.customer.last_name}` }} 
                                    <span class="text-muted ml-2 mdi mdi-phone"></span> {{ order.customer.phone_number }}</small>
                            </h5>
                        </div>
                    </div>
                </template>

                
                <!-- show setion only status_id 2 accepted or status 6 dispatching-->
                <template v-if="order.status_id == 2 || order.status_id == 6">
                    <div class="row border-bottom">
                        <div class="col-6">
                            <h5 class="page-title">{{ $t("Order") }} #{{ order.id }} <br>
                                <small class="h6">{{ `${order.customer.first_name} ${order.customer.last_name}` }} 
                                    <span class="text-muted ml-2 mdi mdi-phone"></span> {{ order.customer.phone_number }}</small>
                            </h5>
                        </div>

                        <div class="col-6 text-right">
                            <h5 class="page-title">{{ order.total_amount | formatNumber }} $ <br>
                                <small class="h6 text-muted">{{ order.items.length }} items</small>                                      
                            </h5>
                        </div>
                    </div>
                </template>

                
                <div v-if="order.distributor && order.status.id == 6" class="row pt-3 pb-3 border-bottom">
                    
                    <div class="col-6 text-right pr-5 border-right">
                        
                        <div class="row">
                            <div class="col text-right">
                                
                                <img class="rounded-circle" width="60" :src="order.distributor.pic" />
                            </div>
                        </div>        
                        

                        <small class="h2">
                            
                            
                            <!--<span class="text-primary nav-bar-icon mr-2 mdi mdi-28px mdi-bike-fast"></span>-->
                                {{ `${ order.distributor.first_name } ${ order.distributor.last_name }` }}
                            </small>    
                            
                            <br>
                            <small class="text-muted h6 pt-0 mt-0">Domiciliario</small>
                            <br>
                            <small class="h6">{{ order.distributor.phone_number }}</small>
                           
                    </div>
                    <div class="col-6 text-left pl-5">
                        <small class="h2">
                            
                            <span class="text-primary nav-bar-icon mr-2 mdi mdi-28px mdi-clock-outline"></span>
                                {{ order.delivered_time }}                              
                            </small>                      
                            <br>
                            <small class="h6 text-muted">tiempo de llegada</small>
                        
                    </div>
                </div>

                <template v-if="order.status_id == 1">
                    <div v-show="!orderAccept" class="row pt-3 pb-3 text-center border-bottom">

                        <div class="col-12 mb-3">
                            Recojer en 
                        </div>
                        
                        <div class="clearfix col-12 text-center">

                            <div class="row ">
                                
                                <div class="col-4 col-md-5 col-xl-5 text-right">
                                    <button                                
                                    @click="minusTimePickUp()"
                                    v-long-press="300"
                                    @long-press-start="onMinusPressStart()"
                                    @long-press-stop="onMinusPressStop()"
                                    type="button" class="btn btn-circle btn-lg btn-secondary">
                                        <span class="mdi mdi-minus"></span>
                                    </button>
                                </div>

                                <div class="col-4 col-md-2 col-xl-2 text-center">
                                    <h5 style="top:3px" class="page-title text-center"> {{ order.ready_time }}
                                        <p>   
                                        <small class="text-center text-muted" style="font-size:15px">{{ $t("minutes")}}</small>
                                        </p>
                                    </h5>
                                </div>

                                <div class="col-4 col-md-5 col-xl-5 text-left">
                                    <button
                                    @click="plusTimePickUp()"
                                    v-long-press="300"
                                    @long-press-start="onPlusPressStart()"
                                    @long-press-stop="onPlusPressStop()" class="btn btn-circle btn-lg btn-secondary">
                                        <span class="mdi mdi-plus"></span>
                                    </button>
                                </div>
                            </div>
                            
                        </div>

                    </div>

                    <div  v-show="!orderAccept" class="row pt-3 ">
                        <div class="col-12">
                            <h5 class="page-title text-center">{{ order.total_amount | formatNumber }} $
                                <p>
                                <small class="h6 text-muted">{{ order.items.length }} items</small>                      

                                <small class="h6 text-muted"> <span style="font-size:15px" class="ml-4 text-muted mdi mdi-clock-outline"> </span> {{ order.date_time | fromNow }} </small>                      
                                
                                </p> 
                                
                            </h5>
                        </div>
                    </div>


                    <div v-show="!orderAccept"  class="row pb-3 text-center border-bottom">
                        <div class="col-6">
                            <button @click="toggleModal()" type="button" style="width:130px" class="float-right btn btn-danger pr-4 pl-4 btn-lg">{{ $t("Decline") }}</button>
                        </div>
                        <div class="col-6">
                            <button @click="acceptOrder()" type="button" style="width:130px" class="float-left btn btn-success pr-4 pl-4 btn-lg ">{{ $t("Accept") }}</button>
                        </div>
                    </div>

                    
                </template>

                <div v-show="order.status_id == 2" class="row pt-4 pb-4 text-center border-bottom">
                    <div class="col-12">
                        <div class="row">
                            <div class="col-12 text-center">
                                <h5 class="page-title">Asignar despachador</h5>
                            </div>
                        </div>
                        <div class="row justify-content-md-center">
                            <div class="col-4 text-center">
    
                                <div class="form-group">
                                    <input v-debounce:700ms="searchDistributor" type="text" class="pr-15 form-control" placeholder="Nombre ó cédula del despachador"
                                    v-model="distributorSearch"/>

                                    <span v-show="distributorSearch.trim().length > 0" @click="resetFilter()" class="link-pointer mdi mdi-close position-absolute"></span>
                                    <span v-show="distributorSearch.trim().length == 0" class="link-pointer mdi mdi-magnify position-absolute"></span>
                                </div>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 text-center pt-2">
                                
                                <ul class="list-group text-center list-group-horizontal-sm justify-content-md-center">
                                    <li style="width:200px" v-for="distributor in distributors" :key="distributor.id" class="list-group-item text-center">
                                        <img class="rounded-circle" width="60" :src="distributor.pic" />
                                        <p>
                                        {{distributor.first_name}} {{distributor.last_name}}<br>
                                        <small class="clearfix text-muted">{{distributor.phone_number}}</small> 
                                        <small class="clearfix text-muted">(a 6 min) </small> 
                                         
                                        <button @click="setDistributor(distributor)" class="clearfix mt-2 btn btn-sm btn-success">Asignar</button>
                                        </p>
                                        
                                    </li>                                   
                                </ul>   

                                
                            </div>
                        </div>

                        
                    </div>
                </div>

                <!-- <div v-show="!order.distributor && order.status_id == 2"  class="row pt-4 pb-4 text-center border-bottom"> -->
                 
                    <!-- <div class="col-12">
                        <span class="mdi mdi-48px mdi-map-marker-radius"></span>
                        <div class="clearfix"></div>
                        <small class="h6 text-muted mt-3">Buscardo domiciliario, hay uno a 6 minutos</small>
                        <div class="clearfix"></div> -->
                        <!--
                        <button type="button" class="mt-3 mb-3 btn btn-primary pr-4 pl-4 btn-lg ">{{ $t("Request pickup") }}</button>
                       
                        -->
<!--                         
                    </div>
                </div> -->

                 
                <orderDetails :order="order"/>
                
                
            </div>
        </template>

        <modalOrderDecline v-if="showModal" :order="order" />

    </div>
</template>

<script>

import Vue from 'vue';
import orderDetails from '@/components/orderDetails'
import modalOrderDecline from '@/components/modalOrderDecline'
import { mapState } from 'vuex'
import LongPress from 'vue-directive-long-press'
import vueDebounce from 'vue-debounce';

Vue.use(vueDebounce);

export default {
    components:{
        orderDetails,
        modalOrderDecline
    },
    directives: {
        'long-press': LongPress
    },
    name: 'orderAccepted',
    data(){
        return {
            showBtnAssign:false,    
            distributorSearch:'',                    
            requestPickUp:false,
            orderAccept:false,
            loading:false,
            modalVisible:false,                             
            saveReadyTimeInterval: null,
            minusInterval: null,            
            distributors:[],
            querySearch:'',
        }
    },
    props: {
        order: {
            type: Object,
            required: true    
        }
    },    
    created(){
        this.getOrder()
    },
    watch:{
        order(value){
            this.orderAccept = false
            this.getOrder(value)
        },
    },
    computed:{
        ...mapState(['showModal'
        ])
    },
    methods: {
        setDistributor(distributor){
            const payload = {
                distributor_id: distributor.id,
                status_id: 6,
                order:{
                    id: this.order.id
                }
            }

            this.$store.dispatch('setDistributorOrder', payload).then(() =>{
                
                this.distributorSearch = ''
                this.distributors = []
                this.showBtnAssign = false 
            })
            

        },
        searchDistributor(){
            if(this.distributorSearch.length > 0){           
                this.$store.dispatch('getDistributors', this.distributorSearch).then(response =>{
                    this.distributors = response
                    if(this.distributors.length > 0){
                        this.showBtnAssign = true
                    }else{
                        this.showBtnAssign = false
                    }
                })
            }
        },
        resetFilter(){
            this.distributors = []
            this.distributorSearch = ''
            
            this.showBtnAssign = false 
        },
        saveReadyTime(){
            
            clearInterval(this.saveReadyTimeInterval)
            
            this.saveReadyTimeInterval = setTimeout(() => {
                
                const payload = {
                    order:this.order,
                    ready_time:this.order.ready_time
                }

                this.$store.dispatch('setReadyTimeOrder',payload)

            },2000)
        },
        onMinusPressStart () {            
            this.plusInterval = setInterval(() => {                
                this.minusTimePickUp()
            }, 150)
        },
        onMinusPressStop () {
            clearInterval(this.plusInterval)
            this.saveReadyTime()
        },
        onPlusPressStart () {            
            this.plusInterval = setInterval(() => {                
                this.plusTimePickUp()
            }, 150)
        },
        onPlusPressStop () {
            clearInterval(this.plusInterval)
            this.saveReadyTime()
        },
        acceptOrder(){
            this.orderAccept = true

            this.$store.dispatch('setAcceptOrder',{order: this.order})

            const payload = {
                distributor_id:1,
                order: this.order
            }

            setTimeout(() => {
                this.$store.dispatch('setDistributorOrder',payload)
                
            },4000)
        },
        minusTimePickUp(){
            if (this.order.ready_time <= 1) return 
            this.order.ready_time--
        },
        plusTimePickUp(){
            if (this.order.ready_time >= 60) return 
            this.order.ready_time++
        },        
        getOrder(){            

            this.loading = true
            
            setTimeout(() => {
                this.loading = false    
            }, 600);
            
        },
        toggleModal(){

            this.$store.commit('toggleShowModal')
        }
        
    }
    
}
</script>

<style scoped>

.link-pointer{
    cursor: pointer;
    top: 18px;
    right:22px;
}
#order-box{
    padding-left: 340px;
    box-shadow: 0 10px 40px 0 rgba(62, 57, 107, 0.07), 0 2px 9px 0 rgba(62, 57, 107, 0.06);border-right: 1px solid rgb(236, 236, 236);
    height: 100vh;
    /*
    border-left: 1px solid #ececec;
    border-top: 1px solid #ececec;
    */
    background-color:#fff !important
}

@media 
only screen and (max-width: 778px),
(min-device-width: 768px) and (max-device-width: 937px)  {
    #order-box {
        margin-right: 0 !important;
        margin-left: 1rem !important;
        height: 100% !important;        
    }
}
</style>