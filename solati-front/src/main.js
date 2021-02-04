import Vue from 'vue'
import firebase from 'firebase'
import App from './App.vue'
import { store } from './store'
//import { modalStore } from './store/modalsStore'

import VueLodash from 'vue-lodash'
import lodash from 'lodash'
import BootstrapVue from 'bootstrap-vue'
import router from './router'
import VueSweetalert2 from 'vue-sweetalert2'

import pagination from '@/components/Pagination.vue'
import Loading from '@/components/Loading.vue'

import { library } from '@fortawesome/fontawesome-svg-core'
import { faCircleNotch  } from '@fortawesome/free-solid-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// Filters
import formatNumber from '@/filters/formatNumber'
import capitalize from '@/filters/capitalize'
import formatDate from '@/filters/formatDate'
import fromNow from '@/filters/fromNow'

// Plugins
import EventBus from './plugins/event-bus'
import i18n from './i18n'
import axios from './plugins/axios'
//import vuemoment from 'vue-moment'
//import * as VueGoogleMaps from 'vue2-google-maps'

axios.bootstrap()
//axios.setHeaderAuthorization(store.state.authToken)


library.add(faCircleNotch)
library.add(fab)

Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.component('pagination', pagination)
Vue.component('Loading', Loading)

Vue.use(BootstrapVue)
Vue.use(VueLodash, { name: 'custom' , lodash: lodash })
Vue.use(VueSweetalert2)
Vue.use(require('vue-moment'))
Vue.use(formatNumber)
Vue.use(capitalize)
Vue.use(formatDate)
Vue.use(fromNow)
Vue.use(EventBus)
import * as VueGoogleMaps from 'vue2-google-maps';
Vue.use(VueGoogleMaps, {
    load: {
      key: process.env.GOOGLE_MAPS_KEY,   
      libraries: 'places', 
    },
  
    installComponents: true
  })
Vue.config.devtools = true
Vue.config.debug = true
Vue.config.silent = false

// CSS Globals
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import './assets/scss/app.scss'

Vue.config.productionTip = false

const firebaseConfig = {
    apiKey: 'AIzaSyDmel7ujWCq8XAVjx26cJbGU6kDWKCJhM8',
    authDomain: 'delivery-278619.firebaseapp.com',
    databaseURL: 'https://delivery-278619.firebaseio.com',
    projectId: 'delivery-278619',
    storageBucket: 'delivery-278619.appspot.com',
    messagingSenderId: '424954557327',
    appId: '1:424954557327:web:19c36ff64ae1ccf51451fa',
    measurementId: 'G-9XCVNR7GTW'
}

// Initialize Firebase
firebase.initializeApp(firebaseConfig)
firebase.analytics()

  
router.beforeEach((to, from, next) => {

	if (to.matched.some(record => record.meta.requiresAuth) && !store.getters.isLoggedIn) { 

        next({ 
           name: 'auth/sign_in', query: { redirect: to.fullPath } 
        })

    } else {
    
        const nearestWithTitle = to.matched.slice().reverse().find(record => record.meta && record.meta.title);

        if (nearestWithTitle){
            document.title = to.meta.title
        }
    
        next();
    }
})

new Vue({
    store,
    router,
    i18n,
    render: h => h(App)
}).$mount('#app')