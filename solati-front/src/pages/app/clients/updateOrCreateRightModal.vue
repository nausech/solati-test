
<template>
    <RightModal modalName="vehicleShow" title="Player" >
        
        <template slot="title">                  
            <button @click.prevent="updateOrCreate()" class="mr-2 btn btn-success">
                <template v-if="loadingSave">
                    <font-awesome-icon icon="circle-notch" class="btn-icon" spin/>
                </template>

                Guardar
            </button>
        </template>

        <template slot="close_button">           
            <button @click="closeModal" type="button" class="close" aria-label="close">
                <span class="mdi-28px mdi mdi-close"></span>
            </button> 
        </template>

        <template slot="body">                                  
           
            <div class="row ml-0 mr-0">
                <div class="col">   

                    <div class="row">
                        <ErrorAlert  :errors="errors"></ErrorAlert>
                    </div>                                         

                    <form class="form">

                        <div class="row">
                            <div class="col-12">                                
                               
                               
                                <div class="form-group row">          
                                    <b-form-checkbox class="cursor-pointer" v-model="vehicle.actived"  switch >
                                        <span style="font-size:14px">{{ (vehicle.actived ? 'Activo':'Inactivo') }}</span>
                                    </b-form-checkbox>
                                </div>
                                
                                
                                <div class="form-group row">          
                                    <label for="name">Nombre</label>                        
                                    <input v-model="vehicle.name" type="text" class="form-control" name="name">
                                </div>   

                                                        

                                <div class="form-group row">          
                                    <label for="name">Descripción</label>                        
                                    <textarea v-model="vehicle.source_address" type="text" class="form-control"></textarea>
                                </div>  

                              
                                
                            </div>
                        </div>
                    </form>
                
                </div>
            </div>
            
        </template>
    </RightModal>

    
</template>

<script>
import Vue from 'vue'
import { mapState, mapGetters } from 'vuex'
import VueSweetalert2 from 'vue-sweetalert2'
import VSwatches from 'vue-swatches'
import "vue-swatches/dist/vue-swatches.css"
import RightModal from '@/components/RightModal'
import ErrorAlert from '@/components/ErrorAlert'

Vue.use(VueSweetalert2)

export default {
    components: { VSwatches, RightModal, ErrorAlert }, 
    name:'updateOrCreateRightModal',
    data(){
        return {
            isNew:false,
            errors: [],
            loadingSave:false
        }
    },
    created() {        
        this.$store.dispatch('getDistributors')     
        this.$store.dispatch('getVehiclesTypes') 
        this.$store.dispatch('getVehiclesColors')  

        if (this.lodash.isEmpty(this.vehicle)){
            this.isNew = true
        }
    },
    computed: {
        ...mapState(['distributors','vehiclesTypes','vehiclesColors']),        
        ...mapGetters(['colorsAvailables']),
    },
    props:{
        vehicle:{
            type: Object
        }
    },
    methods:{   
        checkForm(){
            
            this.errors = []
            
            if (!this.vehicle.name) {
                this.errors.push('El nombre es requerido.')
            }          
            
            if (!this.vehicle.plate) {
                this.errors.push('La placa es requerida.')
            }

            if (!this.vehicle.model) {
                this.errors.push('El modelo es requerido.')
            }

            if (!this.vehicle.type_id) {
                this.errors.push('El tipo de vehiculo es requerido.')
            }
            
            if (!this.vehicle.color) {
                this.errors.push('El color es requerido.')
            }

            

            if (this.errors.length == 0) return true

            return false
        },
        updateOrCreate(){           
            
            if (!this.checkForm()) return
            
            if (this.isNew){
                this.create()
            }
            else{
                this.update()
            }
        },
        create(){

            const payload = {
                vehicle: this.vehicle
            }

            this.loadingSave = true

            this.$store.dispatch('addVehicle',payload)   
            .then(() => {   
                
                this.loadingSave = false    

                this.$swal({
                    title: this.$t('The vehicle is created successfully.'),                    
                    type: 'success',
                    customClass: 'bg-body',                
                    confirmButtonClass: 'btn btn-success font-weight-light',                
                    confirmButtonColor: '#53D190',                                
                }).then(() => {                                    
                    this.closeModal()                    
                })
                .catch((error) => {
                    this.loadingSave = false 
                    console.log(error)
                })
            })     
        }, 
        update(){

            const payload = {
                vehicle: this.vehicle
            }

            this.loadingSave = true
            
            this.$store.dispatch('setVehicle',payload)
            .then(() => {    
                
                this.loadingSave = false  

                this.$swal({
                    title: this.$t('Success'),
                    text: this.$t("The vehicle is updated successfully"),
                    type: 'success',
                    customClass: 'bg-body',                
                    confirmButtonClass: 'btn btn-success font-weight-light',                
                    confirmButtonColor: '#53D190',                                
                }).then(() => {                        
                    this.closeModal()                    
                })  
            })
            .catch((error) => {
                this.loadingSave = false 
                console.log(error)
            })
            
        },
        closeModal(){
            this.errors = []
            this.$store.dispatch('modals/showModalToggle','vehicleShow')    
        }            
    }
}
</script>

<style lang="css">
    .vue-swatches__trigger{
        width: 22px !important;
        height: 22px !important;
    }
</style>