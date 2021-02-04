import axios from 'axios'
import { store } from '../store'




axios.interceptors.response.use((response) => {
    store.commit('loading', false)
  
    return response
}, (error) => {
    
    store.commit('loading', false)
    
    if (error.response.status == 401){   
        store.dispatch('logOut')
    }
})

function bootstrap(){
    window.axios = axios    
    window.axios.defaults.baseURL = process.env.VUE_APP_API_URL    
    window.axios.defaults.headers.common['Content-Type'] = 'application/json'
    window.axios.defaults.headers.common['Authorization'] = `Bearer ${store.state.authToken}`
    window.axios.defaults.withCredentials = true
}

function setHeaders(){    
    
    window.axios.defaults.withCredentials = true
}

function setHeaderAuthorization(token){
    window.axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
}

export default {
    setHeaders,
    bootstrap,
    setHeaderAuthorization
}