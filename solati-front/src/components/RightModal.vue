<template>
    <div >
    
        <transition name="fade" mode="out-in" >
            <div style="
            position:fixed;
            z-index:1040;
            top:0;
            bottom:0;
            right:0;
            left:0 " @click="closeModal($event)" v-show="showToggle" id="modalOverlay" ></div>
        </transition>

        <transition name="slide-modal">
            <div style="
            position:fixed;
            z-index:1040;
            top:0;
            bottom:0;
            right:0;
            left:0 " v-if="showToggle"  >

                <div class="text-left bg-light h-100 top float-right" :style="`min-width: ${width};overflow-x: hidden;width:auto`">
                            
                    <div class="border-bottom mb-0 d-flex px-3 py-3">
                        <div class=" font-weight-normal col mb-0 pl-0 text-dark">
                            <slot name="title" ></slot>
                        </div>
                                        
                        <template>
                            <slot name="close_button"></slot>    
                        </template>
                        
                    </div>

                    <div class="m-3">
                        <slot  name="body" ></slot>
                    </div>

                </div>    
            
            </div>    
        </transition>
    </div>
    
</template>

<script>

import { mapState } from 'vuex'

export default {        
    
    name: 'RightModal',      
    props:{
        title:{
            type:String
        },
        modalName:{
            type:String
        },
        toggle:{
            type: Boolean,
            default: false
        },
        width:{
            type: String,
            default: '500px'
        }
    },
    data () {
        return {}
    },        
    computed: {        
        ...mapState('modals',['modalToggleStore']),
        showToggle(){


            const find = this.modalToggleStore.filter((modal) => {
                return (modal.name == this.modalName)
            })

            return (find.length > 0 ? true : false)
        }
    },
    methods: {        
        closeModal(e){
            const targetId = e.currentTarget.id;

            alert(targetId)

            /*
            if(e.target.id == 'cont-modal'){
                alert('sss')
                this.$store.dispatch('modals/showModalToggle',this.modalName)    
            }
            */
            
        }
    },
}
</script>

<style>
    


.slide-modal-enter-active,
.slide-modal-leave-active
{
    transition: transform 0.2s ease;
}

.slide-modal-enter,
.slide-modal-leave-to {
    transform: translate(100%);
    transition: all 150ms ease-in 0s
}

    
</style>