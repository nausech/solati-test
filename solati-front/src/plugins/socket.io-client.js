import Vue from 'vue'
import VueSocketIOExt from 'vue-socket.io-extended'
import io from 'socket.io-client'

const socket = io(process.env.SOCKET_HOST)
        
Vue.use(VueSocketIOExt, socket)

export default socket