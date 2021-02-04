<template>
    <div>
        <Modal>
            <template slot="title">      
                {{ $t("Select your reason for declining") }}
                
            </template>
            
            <template slot="top">      
                <button style="right:0;z-index: 5;"  type="button" @click="toggleModal()" class="close float-right" aria-label="close">
                    <span class="mdi-28px mdi mdi-close-circle"></span>
                </button>              
            </template>

            <template slot="body">  
                <template v-if="showAreaForOtherReason">                  
                    <div class="row text-center">
                        <div class="col-12">
                                
                            <div class="row">

                                <div class="col-12 mr-0 ml-0 pr-0 pl-0">
                                    <textarea v-model="otherDeclineReason" :placeholder="`${$t('Here you can specify the reason for rejecting this order')}`" class="w-100 form-control" name="" id="" cols="30" rows="10"></textarea>
                                </div>

                                <div class="col-12 mt-3 mr-0 ml-0 pr-0 pl-0">
                                    <button @click="setDeclineOrder(otherDeclineReason)" :disabled="!otherDeclineReason || otherDeclineReason.length < 0" class="btn btn-success float-right">{{ $t("Confirm") }}</button>
                                    <button @click="showAreaForReason()" class="mr-3 btn btn-danger float-right">{{ $t("Back") }}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </template>
                <template v-else>
                    <div class="row text-center mb-3">
                        
                        <div :key="index" v-for="(reason,index) in reasonsDeclineOrders" class="col-4">
                            
                            <button @click="setDeclineOrder(reason.name)" type="button" class="menu-item-top logout-button" >
                                
                                <span v-if="reason.id == 1" style="color:#bd2130 !important" class="menu-item-top nav-bar-icon mr-2 mdi mdi-48px mdi-timer-off"></span>
                                
                                <span v-if="reason.id == 2" style="color:#FF976A !important" class="menu-item-top nav-bar-icon mr-2 mdi mdi-48px mdi-coffee-off-outline"></span>


                                <br>
                                <small class="h6">{{ $t(reason.name) }}</small>
                                
                            </button> 
                            
                        </div>

                        <div class="col-4">
                            <button @click="showAreaForReason()" type="button" class="menu-item-top logout-button" >
                                
                                <span style="color:#bd2130 !important" class="menu-item-top nav-bar-icon mr-2 mdi-48px mdi mdi-card-text-outline"></span>
                                <br>
                                <small class="h6">{{ $t("Other") }}</small> 
                                
                            </button>
                        </div>
                    </div>
                </template>
            </template>
        </Modal>
    </div>
</template>

<script>
import { mapState } from 'vuex'
import Modal from '@/components/Modal'

export default {
    components:{
        Modal
    },
    name:'modalOrderDecline',
    props:{
        order: {
            type: Object,
            required : true
        }
    },
    data(){
        return {
            showAreaForOtherReason: false,
            otherDeclineReason:null,
        }
    },
    computed:{
        ...mapState(['showModal','reasonsDeclineOrders'])
    },
    created(){        
        this.$store.dispatch('getReasonsDeclineOrders')
    },
    methods:{        
        setDeclineOrder(reason){

            const payload = {
                order: this.order,
                reason: reason
            }

            this.$store.dispatch('setDeclineOrder',payload).then(() => {

                this.otherDeclineReason = null
                this.toggleModal()
            })
        },
        toggleModal(){

            this.$store.commit('toggleShowModal')
            this.showAreaForOtherReason = false   
        },
        showAreaForReason(){
            this.showAreaForOtherReason = !this.showAreaForOtherReason
        },
    }
}
</script>