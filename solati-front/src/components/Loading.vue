<template>
    <div class="loading">
        <div class="loader mx-auto my-5 py-5 text-center">
           
            <span :class="className"></span>
            
            <!--
            <br>
            <h6 class="text-dark">Loading</h6>
            -->
        </div>
    </div>
</template>

<script>
export default {
  name: 'loading',
  data(){
      return {
          className:null
      }
  },
  props:{
      size:{
          type:Number,
          default:68
      }
  },
  created(){

      this.className = `mdi-${this.size}px mdi mdi-loading mdi-spin`
  }
}
</script>

<style scoped lang="scss">
    .mdi-loading{
        color:#01274C !important;
    }
    .absolute{
        h6{
            color:#8697a2
        }
        &.loading{        
            width:           100%;
            height:          100%;
            display:         flex;
            justify-content: center;

            .loader{                
                display:         flex;
                justify-content: center;
                align-content:   stretch;
                flex-direction:  column;
                align-items:     center;
            }
        }
    }
</style>