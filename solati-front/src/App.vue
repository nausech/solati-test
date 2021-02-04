<template>
  <div  id="app">

    <div>
      <!--
      <template v-if="loading">    
        <loading></loading>
      </template>
      -->

      <transition name="fade" mode="out-in">
        <router-view></router-view>
      </transition>
    </div>
  </div>
</template>

<script>

import Vue from 'vue';
import { mapState } from 'vuex'
import VueSweetalert2 from 'vue-sweetalert2'
import { loadProgressBar } from 'axios-progress-bar'
import 'axios-progress-bar/dist/nprogress.css'
loadProgressBar()

Vue.use(VueSweetalert2);

export default {
  
  computed :{
      ...mapState([
          'loading'
      ])
  }
}
</script>
 
<style scope>
#nprogress .bar {
    background: #fff !important;
}

#nprogress .peg {
    box-shadow: 0 0 10px #fff, 0 0 5px #fff !important;
}

#nprogress .spinner-icon {    
    display: none;
}

.fade-enter-active {
  transition: opacity 1s ease-in-out;
}
.fade-enter-to{
  opacity: 1;
}
.fade-enter{
  opacity: 0;
}

</style>
