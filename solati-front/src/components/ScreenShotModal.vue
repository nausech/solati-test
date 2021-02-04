<template>
    
    <div id="modalOverlay" @click="closeModal">

        <div class="text-left h-100 top float-right" style="overflow-y: auto;width:100%; background:#000">
                    
            <div style="z-index:3000" class="position-fixed d-flex px-4 py-4 w-100">
                <h5 class="font-weight-normal col mb-0 text-white">{{ title }}</h5>
                
                <button @click="playerHide" type="button" class="close position-absolute" style="right:40px" aria-label="close">
                    <span class="text-white mdi-28px mdi mdi-close"></span>
                </button>

            </div>

            <div style="width: 95%;top: 50%;left: 50%;transform: translate(-50% , -50%);position: absolute;" class="text-center">
                <slot name="body" ></slot>
            </div>

        </div>    
    
    </div>    
    
</template>

<script>

import { mapMutations } from 'vuex'

export default {        
    name: 'ScreenShotModal',      
    props:{
        title:{
            type:String
        }
    },
    data () {
        return {}
    },        
    methods:{
        ...mapMutations([
          'playerHide'
        ]),        
        closeModal(e){

            if(e.target.id == 'modalOverlay'){
                return this.playerHide()
            }
            
        }
    }
}
</script>

<style>
    
    #modalOverlay{
        background-color: rgba(0,0,0,0.6);
        z-index:1040;
        position:fixed;
        top:0;
        bottom:0;
        right:0;
        left:0 
    }
    
</style>
