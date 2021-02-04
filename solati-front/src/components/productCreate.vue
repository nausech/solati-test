<template>
    <div>
        <template v-if="loading">    
            <loading></loading>
        </template>
    
        <template v-else>         
            <div>
                <div class="d-flex align-items-center auth-login">
                    <div class="row w-100 mx-auto">     
                        <div class="col-12">      
                            <div class="auto-form-wrapper"> 
                                    <h5 class="text-left mt-4 mb-5">{{$t("Create product")}}</h5>     
                                        <div class="form-group">
                                            <div class="input-group" :class="{'is-danger': errors.name }">
                                                <input class="form-control input-border" v-model="form.name" type="name" placeholder="Nombre del producto">
                                            </div>
                                            <span v-if="errors.name" class="text-danger float-left small">{{ errors.name }}</span>
                                        </div>

                                        <div class="form-group ">
                                            <div class="input-group" :class="{'is-danger': errors.sort_description }">
                                                <input class="form-control input-border" v-model="form.sort_description" type="text" placeholder="Descripción">
                                            </div>
                                            <span v-if="errors.sort_description" class="text-danger float-left small">{{ errors.sort_description }}</span>
                                        </div>

                                        <div class="form-group ">
                                            <div class="input-group" :class="{'is-danger': errors.unit_price }">
                                                <input class="form-control" style="height:80%" v-model="form.unit_price" type="number" :placeholder="$t('Price')">
                                            </div>
                                            <span v-if="errors.unit_price" class="text-danger float-left small">{{ errors.unit_price }}</span>
                                        </div>
                                        <div class="form-group ">
                                            <div class="input-group" :class="{'is-danger': errors.time_estimate }">
                                                <input class="form-control" style="height:80%" v-model="form.time_estimate" type="number" placeholder="Tiempo estimado">
                                            </div>
                                            <span v-if="errors.time_estimate" class="text-danger float-left small">{{ errors.time_estimate }}</span>
                                        </div>
                                        <div class="form-group ">
                                            <div class="input-group" :class="{'is-danger': errors.in_discount }">
                                                <p>En descuento</p>
                                                <select style="width:100%"  v-model="form.in_discount" placeholder="En descuento">
                                                    <option value="false">No</option>
                                                    <option value="true">Si</option>
                                                </select>
                                            </div>
                                            <span v-if="errors.in_discount" class="text-danger float-left small">{{ errors.in_discount }}</span>
                                        </div>
                                        <div class="form-group" v-if="form.in_discount == 'true'">
                                            <div class="input-group" :class="{'is-danger': errors.discount_percent }">
                                                <input class="form-control" style="height:80%" v-model="form.discount_percent" type="number" placeholder="Porcentaje de descuento">
                                            </div>
                                            <span v-if="errors.discount_percent" class="text-danger float-left small">{{ errors.discount_percent }}</span>
                                        </div>
                                        <div class="form-group ">
                                            <div class="input-group" :class="{'is-danger': errors.actived }">
                                                <p>Producto activo</p>
                                                <select style="width:100%" v-model="form.actived"  placeholder="Producto activo">
                                                    <option value="false">No</option>
                                                    <option value="true">Si</option>
                                                </select>
                                            </div>
                                            <span v-if="errors.actived" class="text-danger float-left small">{{ errors.actived }}</span>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group" :class="{'is-danger': errors.pic }">
                                                <b-form-file
                                                accept="image/jpeg, image/png"
                                                v-model="form.pic"
                                                :state="Boolean(form.pic)"
                                                placeholder="Seleccione una imagen"
                                                drop-placeholder="Seleccione una image..."
                                                ></b-form-file>
                                            </div>
                                            <span v-if="errors.pic" class="text-danger float-left small">{{ errors.pic }}</span>
                                        </div>
                                        <div class="form-group">
                                            <div class="input-group" :class="{'is-danger': errors.friendly_url }">
                                                <input class="form-control" v-model="form.friendly_url" type="text" placeholder="Url amigable">
                                            </div>
                                            <span v-if="errors.friendly_url" class="text-danger float-left small">{{ errors.friendly_url }}</span>
                                        </div>
                                        <div class="form">
                                            <label  for="name">Tags separados por coma</label> 
                                            <Tags  :model.sync="form.tags"></Tags>  
                                            <!-- <div>
                                                <b-form-tags addButtonVariant="success" tagVariant="success" 
                                                placeholder="Agregar tag" v-model="form.tags" addButtonText="Agregar"
                                                class="mb-2"></b-form-tags>
                                            </div> -->
                                            <span v-if="errors.tags" class="text-danger float-left small">{{ errors.tags }}</span>
                                        </div>
                                        <div class="form-group ">
                                            <button @click="createProduct()" type="button" class="mt-4 btn btn-success btn-lg btn-block full_rounded">
                                                <font-awesome-icon v-if="loading" icon="circle-notch" class="btn-icon" spin/>
                                                {{ $t("Save")}}
                                            </button>

                                            <transition name="fade">
                                                    
                                                <b-alert v-show="errors.credentials" show class="mt-4" variant="danger">
                                                    {{ errors.credentials }}
                                                </b-alert>

                                            </transition>
                                        </div>
                                        
                            </div>
                        </div>
                    </div>
                </div>
    </div>
        </template>

        <modal v-if="showModal">

        </modal>

    </div>
</template>

<script>

import modal from '@/components/Modal'
import { mapState, mapMutations } from 'vuex'
import LongPress from 'vue-directive-long-press'
import debounce from 'lodash/debounce';
import Tags from '@/components/Tags'

export default {
    components:{
        modal,
        Tags
    },
    directives: {
        'long-press': LongPress
    },
    name: 'orderAccepted',
    data(){
        return {  
            form: {
                name: '',
                sort_description: '',
                unit_price:0,
                time_estimate:'',
                in_discount:'false',
                discount_percent:0,
                actived: 'true',
                pic: null,
                friendly_url:'',
                tags:''

            },
            errors: {
                name: false,
                sort_description: false,
                credentials: false,
                unit_price: false,
                discount_percent:false,
                actived:false,
                pic:false,
                friendly_url:false,
                tags:false
            },                      
            requestPickUp:false,
            orderAccept:false,
            loading:false,
            modalVisible:false,                             
            saveReadyTimeInterval: null,
            minusInterval: null,            
        }
    },
    props: {
        categoryId: {
            type: Number,
            required: true    
        }
    },
    watch:{
        categoryId(value){
            this.categoryId = value
        }
    },     
    computed:{
        ...mapState([
            'showModal', 
            'productsPartnerCategorie',
            'aditionals'
        ])
    },
    methods: {
        createProduct(){
                const product = {
                    name: this.form.name,
                    sort_description: this.form.sort_description,
                    unit_price: this.form.unit_price,
                    time_estimate: this.form.time_estimate,
                    in_discount: this.form.in_discount,
                    discount_percent: this.form.discount_percent,
                    out_of_stock: this.form.actived,
                    pic: this.form.pic,
                    friendly_url:this.form.friendly_url,
                    category_id:this.categoryId,
                    tags:this.form.tags.join()
                }

                this.$store.dispatch('storeProductPartner',product).then(response =>{

                    let formData = new FormData()
                    formData.append('pic', this.form.pic)
                    const payload = {
                        id: response.data.data.id,
                        form: formData
                    }   
                    
                    this.$store.dispatch('setImageProduct', payload).then(response =>{
                        this.$store.dispatch('getProductsPartnerCategorie', this.categoryId)
                    })
                    this.$swal({
                        title: 'Datos Insertado!',
                        text: "Producto creado con exito",
                        type: 'success',
                        customClass: 'bg-body rounded-0',
                        confirmButtonClass: 'btn btn-primary font-weight-light',
                    })
                    this.formatForm() 
                                        
                })    
        },

        formatForm(){
            this.form.name= ''
            this.form.sort_description= ''
            this.form.unit_price=0
            this.form.time_estimate=''
            this.form.in_discount='false'
            this.form.discount_percent=0
            this.form.actived= 'true'
            this.form.pic= null
            this.form.friendly_url=''
            this.form.tags=''
            
        }
    }
    
}
</script>

<style scoped>
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