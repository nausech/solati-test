import Vue from 'vue'
import AWN from 'awesome-notifications'

const notify = {}

notify.install = function(){
    Vue.prototype.$notify = new AWN(
        { position:'bottom-right' }
    )
}

export default notify