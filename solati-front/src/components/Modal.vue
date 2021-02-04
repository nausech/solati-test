<template>
    <div>
        <div id="modalOverlay" @click="closeModal">
        </div>   

        <transition name="slide-modal">
            
            <div :class="`modal-${size}`" id="modal-box" class="text-left bg-white position-fixed p-3 border rounded">
                
                <!-- <slot name="top">    
                                                
                    <button @click.prevent="closeModal()" type="button" class="no-print close float-right" aria-label="close">
                        <span class="mdi-28px mdi mdi-close"></span>
                    </button>  
                    
                </slot> -->

                <div class="row">
                    <div class="col">
                        <slot name="top">                            
                        </slot>
                    </div>
                </div>
                
                <div class="row pb-3">
                    <div class="col text-center">
                        <h5 class="page-title modal-title">
                            <slot name="title"></slot>
                        </h5>
                    </div>
                </div>
                
                
                <div class="row">
                    <div class="col">
                        <div class="mt-3">
                            <slot name="body" ></slot>
                        </div>
                    </div>
                </div>

            </div>    
        </transition>
    
     </div>
    
</template>

<script>


import { mapState } from 'vuex'

export default {        
    name: 'Modal',          
    data () {
        return {}
    },   
    props:{
        size:{
            type:String,            
            default: 'big'
        }
    },
    computed: {
        ...mapState(['showModal']),
        showModal(){
            return this.$store.state.showModal
        },
    },    
    created() {
        

    }, 
    methods:{       
        toggleModal(){
            this.$store.commit('toggleShowModal')
        },
        closeModal(e){

            if(e.target.id == 'modalOverlay'){                
                this.$store.commit('toggleShowModal')
            }
          
        }
    }
}
</script>

<style scoped>

    .page-title.modal-title{
        font-size: 1.3rem !important;
        font-weight: 700;
    }

    
    .modal-big{
        right: 15%;
        left: 15%;
    }

    .modal-small{
        right: 35%;
        left: 35%;
    }

    .modal-large{
        right: 2%;
        left: 2%;
    }

    .modal-medium{
        right: 25%;
        left: 25%;
    }

    #modal-box{
        max-height: 80%;
        overflow-y: scroll;
        overflow-x: hidden;
        width: auto;
        transform: translate(0, -50%);
        top: 50%;    
        
        z-index: 10000
    }


    @media 
    only screen and (max-width: 778px),
    (min-device-width: 768px) and (max-device-width: 937px)  {
        #modal-box{
            max-height: 100%;                
            right: 5% !important;
            left: 5% !important;        
        }   
    }

</style>
