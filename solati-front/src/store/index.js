import Vue from 'vue'
import Vuex from 'vuex'
import Service from '@/services'
import AuthService from '@/services/auth'
import createPersistedState  from  'vuex-persistedstate'
import SecureLS from "secure-ls"
const ls = new SecureLS({ isCompression: false })
import router from '../router'
import storeModals from './storeModals'
import storeleftMenuItems from './storeleftMenuItems'

Vue.use(Vuex)

const state = {
    showleftSideMenu:false,
    showModal: false,
    loading:false,    
    authUser:null,
    authToken:null,
    isLoggedIn:false,
    partnerStatuses:[],
    ordersPending:[],
    ordersAccepted:[],    
    preOrders:[],
    reasonsDeclineOrders:[],
    categories:[],    
    aditionals:[],
    showModalNewOrder:false,
    currentOrder:{},
    distributors:[],
    routePlans:[],
    routePlansToday:[],
    vehicles:[],
    vehiclesAvailables:[],
    vehiclesTypes:[],
    vehiclesColors:[],
    filterStatus:0,
    menuAppsShow:false,
    providers:[]
}

const actions = {
    
    AuthGoogleIdToken({ commit, state}, payload){

        const idToken = payload.id_token
        return new Promise((resolve, reject) => {
            
            AuthService
            .Auth()
            .googleIdToken(idToken)
            .then(response => {
                
                const user = response.data.user
                
                commit('SET_IS_LOGGED',true)
                commit('SET_USER_AUTH',user)
                commit('SET_AUTH_TOKEN',response.data.token)


                //setHeaderAuthorization(response.data.token)
                
                window.axios.defaults.headers.common['Authorization'] = `Bearer ${response.data.token}`
                resolve(response) 
                
            })                        
            .catch(err => {
                reject(err)
            })
        
        })
    },
    AuthBasic({ commit, state }, payload){

        const { username,password } = payload
        
        return new Promise((resolve, reject) => {
            let data = {
                email:username,
                password:password,
            }
            // AuthService
            // .Auth()
            // .Basic(username,password)
            // .then(response => {
            alert( process.env.VUE_APP_API_URL)
            axios.post('login', data).then(response=>{
                console.log(response)
                const user = response.data.user
                
                commit('SET_IS_LOGGED',true)
                commit('SET_USER_AUTH',user)
                commit('SET_AUTH_TOKEN',response.data.token)

                window.axios.defaults.headers.common['Authorization'] = `Bearer ${response.data.token}`

                //setHeaderAuthorization(response.data.token)
                resolve(response)       
                
            })            
            .catch(err => {
                reject(err)
            })
        
        })
    },
    getProviders({ commit, state }){
        return new Promise ((resolve, reject) => {
            Service.Providers().getAll().then(response =>{
                resolve(response)
            }).catch(error => {
                reject(error)
            })
        })
    },
    logOut({ commit } ){        
        commit('SET_IS_LOGGED',false)
        commit('SET_USER_AUTH',null)
        commit('SET_AUTH_TOKEN',null)        

        localStorage.clear()
        sessionStorage.clear()
        
        window.axios.defaults.headers.common['Authorization'] = ''

        router.push({name:'auth/sign_in'})  
    },
    getVehicleAvailable({ commit, state },payload){
        
        Service.VehicleAvailable().getAll(payload.date).then(response => {
            
            commit('SET_VEHICLES_AVAILABLE',response.data.data)   
        })
    },
    getVehicles({ commit, state }){
        Service.Vehicles().getAll().then(response => {
            
            commit('SET_VEHICLES',response.data.data)   
        })
    },
    getPreOrders({ commit, state }, url = `pre-orders`){

        //const url = `pre-orders` //payload

        
        Service.PreOrders(url).getAll().then(response => {
            
            commit('SET_PRE_ORDERS',response.data.data)   
        })
    },
    getRoutePlansToday({ commit, state }) {      

        Service.RoutePlansToday().getAll().then(response => {
            
            commit('SET_ROUTE_PLANS_BY_DATE',response.data.data)   
        })
    },
    getRoutePlans({ commit, state }) {      

        Service.RoutePlans().getAll().then(response => {
            
            commit('SET_ROUTE_PLANS',response.data.data)   
        })
    },
    deleteAditional({ commit }, aditionalId){
        Service.Aditionals().delete(aditionalId)
    },
    deleteProduct({ commit }, payload){
        return new Promise ((resolve, reject) => {
            Service.Products().delete(payload.id).then(response =>{
                resolve(response)
            }).catch(error => {
                reject(error)
            })
        })
    },
    vehicleRoutingOptimize({ commit }, payload){
        
        return new Promise((resolve, reject) => {
            
            Service.VehicleRoutingOptimize()
            .store(payload)                       
            .then(response => {
                resolve(response.data)       
            })            
            .catch(err => {
                reject(err)
            })
        
        })
    },
    storeAditional({ commit }, aditional){
        const toStore = {
            name: aditional.name,
            product_id: aditional.product_id,
            unit_price: aditional.unit_price,
        }

        Service.Aditionals().store(toStore)
    },      
    storeProductPartner({ commit, state }, product){
        const toStore = {
            partner_id:state.partner.id,
            name: product.name,
            sort_description: product.sort_description,
            unit_price: parseInt(product.unit_price),
            is_aditional: 'false',
            in_discount: product.in_discount,
            discount_percent: product.discount_percent,
            price_with_discount: 0,
            category_id:product.category_id,
            sub_category_id:0,
            out_of_stock: product.out_of_stock,
            time_estimate: parseInt(product.time_estimate),
            pic: product.pic,
            tags:product.tags,
            friendly_url:product.friendly_url,
        }
        return new Promise ((resolve, reject) => {
            Service.Products().store(toStore).then(response =>{
                resolve(response) 
            }).catch(err =>{
                reject(err)
            })
        })
        
    },   
    setOpening({ commit },payload){
        Service.Openings().update(payload.id,payload).then(()=>{
            
        })
    },
    getSpecialOpenings({ commit , state }){
        Service.SpecialOpeningsPartner().getAll(state.partner.id).then( response => {
            
        })
    },
    getAddressMap({ commit }, payload){
        return new Promise((resolve,reject) => {
            Service.MapService().getAll(payload).then(response => {
                resolve(response)
            }).catch(error => {
                reject(error)
            })
        })
       
    },
    storeSpecialOpening({ commit, state }, payload){
        Service.SpecialOpenings().create(payload).then( response => {
            const partner_id = state.authUser.model_id

                Service
                .Partners()
                .getOne(partner_id)
                .then(response => {                    
                    commit('SET_PARTNER',response.data)
                })
        })
    },
    deleteSpecialOpening({ commit, state }, id){
        Service.SpecialOpenings().delete(id).then( response => {
            const partner_id = state.authUser.model_id
                Service
                .Partners()
                .getOne(partner_id)
                .then(response => {                    
                    commit('SET_PARTNER',response.data)
                })
        })
    },
    updateSpecialOpening({ commit, state }, payload){
        Service.SpecialOpenings().update(payload.id,payload).then( response => {
            const partner_id = state.authUser.model_id
                Service
                .Partners()
                .getOne(partner_id)
                .then(response => {                    
                    commit('SET_PARTNER',response.data)
                })
        })
    },
    getPendingOrders({ commit, state }) {      

        Service.ordersPendingPartner().getAll(state.partner.id).then(response => {
            const orders = response.data.data
            commit('SET_PENDING_ORDERS',orders)
        })
    },
    getAcceptedOrders({ commit , state}) {   

        Service.ordersAcceptedPartner().getAll(state.partner.id).then(response => {
            const orders = response.data.data
            commit('SET_ACCEPTED_ORDERS',orders)
        })
    },
    setAcceptOrder({ commit }, payload) {

        const toUpdate = {
            status_id:2
        }

        Service.Orders().update(payload.order.id,toUpdate).then(() => {
            commit('SET_ACCEPT_ORDER',payload.order)
        })
    },
    setOrderDistributorIsLike({ commit }, payload) {

        const toUpdate = {
            distributor_is_like: payload.distributor_is_like
        }

        Service.Orders().update(payload.order.id,toUpdate).then(response => {            
            console.log(response)
        })
    },
    getReasonsDeclineOrders({ commit }){

        Service.reasonsDeclineOrders().getAll().then(response => {

            const reasons = response.data.data

            commit('SET_REASONS_DECLINE_ORDERS',reasons)
        })
    },
    setDeclineOrder({ commit }, payload) {
        
        const toUpdate = {
            status_id:3,
            decline_reason: payload.reason
        }

        Service.Orders().update(payload.order.id,toUpdate).then(() => {
            commit('SET_DECLINE_ORDER',payload.order)
        })        
    },
    setPartnerStatus({ commit, state }, payload) {
        
        const toUpdate = {
            status_id: payload.status.id
        }
    
        return new Promise((resolve,reject) => {
            Service.Partners().update(state.partner.id,toUpdate).then((response) => {        

                resolve(response)

                commit('SET_PARTNER_STATUS',payload.status)
            })
            .catch(error => {
                reject(error)
            })
        }) 
                
    },
    setImageProduct({ commit }, payload){
 
        return new Promise((resolve,reject) => {
            Service.Products('products-image').updateImage(payload.id,payload.form).then(response => {
                resolve(response)
            }).catch(error => {
                reject(error)
            })
        })
        
    },
    updateAditional({ commit }, payload){

        const toUpdate = {
            name:payload.name,
            unit_price: payload.unitPrice
        }
        return new Promise((resolve,reject) => {
            Service.Aditionals().update(payload.id,toUpdate).then(response => {
                resolve(response)
            }).catch(error =>{
                reject(error)
            })
        })
    },
    setReadyTimeOrder({ commit }, payload){

        const toUpdate = {
            ready_time:payload.ready_time
        }
        
        Service.Orders().update(payload.order.id,toUpdate).then(() => {
            //commit('SET_ACCEPT_ORDER',payload.order)                
        })
    },
    setPartner({ commit, state }, payload){
        console.log()
        const toUpdate = {
            location_coordinates:payload.location_coordinates,
            address:payload.address,
            email:payload.email,
            phone:payload.phone,
        }
        Service.Partners().update(state.partner.id,toUpdate).then(() => {
            //commit('SET_ACCEPT_ORDER',payload.order)                
        })
    },
    setPartnerStatuses({ commit }){
        Service.PartnerStatuses().getAll().then(response => {

            const reasons = response.data.data

            commit('SET_PARTNER_STATUSES',reasons)
        })
    },
    async getOrder({ commit }, payload){
        
        return new Promise((resolve, reject) => {
            Service.Orders().getOne(payload).then((order) => {
                //commit('SET_DISTRIBUTOR_ORDER',payload.order)
                resolve(order.data)
            })
            .catch(error => {
                reject(error)
            })

            
            
        })
        
        
    },
    setDistributorOrder({ commit }, payload){
        
        const toUpdate = {            
            distributor_id: payload.distributor_id,
            status_id: payload.status_id         
        }
        return new Promise((resolve,reject) => {

            Service.Orders().update(payload.order.id,toUpdate).then(response => {
                const order = response.data.data
                commit('SET_DISTRIBUTOR_ORDER',order)
                commit('SET_CURRENT_ORDER_SHOW',order)
                resolve(order)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    setPreOrderStatus({ commit }, payload){
        
        const toUpdate = {                        
            to_routing: payload.to_routing,
            status_id: payload.status_id ,                    
        }
        return new Promise((resolve,reject) => {

            Service.PreOrders().update(payload.order_id,toUpdate).then(response => {
                const order = response.data.data                
                resolve(order)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    getCategories({ commit }) {      

        Service.Categories().getAll().then(response => {
            const categories = response.data.data
            commit('SET_CATEGORIES',categories)
        })
    },
    getDistributors({ commit }) {      

        return new Promise((resolve,reject) => {
            Service.Distributors().getAll().then(response => {
                const distributors = response.data.data
                commit('SET_DISTRIBUTORS',distributors)
                resolve(distributors)
            }).catch(error =>{
                reject(error)
            })
        })
    },
    setDriver({ commit }, payload){
        
        const toUpdate = {            
            first_name: payload.first_name,
            last_name: payload.last_name,
            phone_number: payload.phone_number,
            license_date_expire: payload.license_date_expire,
            address: payload.address,            
            date_birth: payload.date_birth,
            pic: payload.pic
        }

        return new Promise((resolve,reject) => {

            Service.Distributors().update(payload.id,toUpdate).then(response => {
                
                const distributor = response.data.data

                //commit('SET_DISTRIBUTOR',distributor)
                resolve(distributor)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    getProducts({ commit, state }){
        return new Promise((resolve,reject) => {

            Service.Products().getAll().then(response => {
                
                const products = response.data.data

                //commit('SET_DISTRIBUTOR',distributor)
                resolve(products)
            }) .catch(error =>{
                reject(error)
            })
        })

       
    },
    addProduct({ commit }, payload){
        
        const toCreate = {            
            name: payload.name,
            description: payload.description,
            warehouse_id: payload.warehouse_id,
            reference: payload.reference,
            price_cost: payload.price_cost,
            unit_measurement: payload.unit_measurement,
            minimum_amount: payload.minimum_amount,
            maximum_amount: payload.maximum_amount,
            units_per_package: payload.units_per_package,
            can_be_sold: payload.can_be_sold,
            attributes: payload.attributes,
            type_id: payload.type_id,
            actived: payload.actived,
        }

        return new Promise((resolve,reject) => {

            Service.Products().store(toCreate).then(response => {
                
                const product = response.data.data

                resolve(product)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    setProduct({ commit }, payload){
        
        const toUpdate = {            
            name: payload.name,
            description: payload.description,
            warehouse_id: payload.warehouse_id,
            reference: payload.reference,
            price_cost: payload.price_cost,
            unit_measurement: payload.unit_measurement,
            minimum_amount: payload.minimum_amount,
            maximum_amount: payload.maximum_amount,
            units_per_package: payload.units_per_package,
            can_be_sold: payload.can_be_sold,
            attributes: payload.attributes,
            type_id: payload.type_id,
            actived: payload.actived,
        }

        return new Promise((resolve,reject) => {

            Service.Products().update(payload.id,toUpdate).then(response => {
                
                const product = response.data.data

                //commit('SET_DISTRIBUTOR',distributor)
                resolve(product)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    addWarehouse({ commit }, payload){
        
        const toCreate = {            
            name: payload.name,
            short_name: payload.short_name,
            address: payload.address,
            locations: payload.locations,
            operators: payload.operators
        }

        return new Promise((resolve,reject) => {

            Service.Warehouses().store(toCreate).then(response => {
                
                const warehouse = response.data.data

                resolve(warehouse)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    setWarehouse({ commit }, payload){
        
        const toUpdate = {            
            name: payload.name,
            short_name: payload.short_name,
            address: payload.address,
            locations: payload.locations,
            operators: payload.operators
        }

        return new Promise((resolve,reject) => {

            Service.Warehouses().update(payload.id,toUpdate).then(response => {
                
                const warehouse = response.data.data

                //commit('SET_DISTRIBUTOR',distributor)
                resolve(warehouse)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    getWarehouses({ commit } ){
        
        return new Promise ((resolve, reject) => {
            Service.Warehouses().getAll().then(response =>{
                resolve(response)
            }).catch(error => {
                reject(error)
            })
        })

       
    },
    addProvider({ commit }, payload){
        
        const toCreate = {            
            name: payload.name,
            address: payload.address
        }

        return new Promise((resolve,reject) => {

            Service.Providers().store(toCreate).then(response => {
                
                const providers = response.data.data

                resolve(providers)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    setProvider({ commit }, payload){
        
        const toUpdate = {            
            name: payload.name,
            address: payload.address
        }

        return new Promise((resolve,reject) => {

            Service.Providers().update(payload.id,toUpdate).then(response => {
                
                const providers = response.data.data

                //commit('SET_DISTRIBUTOR',distributor)
                resolve(providers)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    setVehicle({ commit }, payload){
        
        const toUpdate = {            
            name: payload.vehicle.name,
            plate: payload.vehicle.plate,
            actived: payload.vehicle.actived,
            model: payload.vehicle.model,
            type_id: payload.vehicle.type_id,
            capacity: payload.vehicle.capacity,
            color: payload.vehicle.color,
            distributor_id: payload.vehicle.distributor_id,
            tecnico_mecanica_date_expire: payload.vehicle.tecnico_mecanica_date_expire,
            soat_date_expire: payload.vehicle.soat_date_expire,
            source_address: payload.vehicle.source_address,
            destination_address: payload.vehicle.destination_address,
        }

        return new Promise((resolve,reject) => {

            Service.Vehicles().update(payload.vehicle.id,toUpdate).then(response => {
                
                const vehicle = response.data.data

                commit('SET_VEHICLES',vehicle)
                resolve(vehicle)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    addDriver({ commit, dispatch }, payload){
        
        const toCreate = {            
            first_name: payload.driver.first_name,
            last_name: payload.driver.last_name,
            identification_number: payload.driver.identification_number,
            phone_number: payload.driver.phone_number,
            license_date_expire: payload.driver.license_date_expire,
            date_birth: payload.driver.date_birth,
            address: payload.driver.address
        }

        return new Promise((resolve,reject) => {

            Service.Distributors().store(toCreate).then(response => {
                
                const driver = response.data.data

                dispatch('getDistributors')

                //commit('SET_VEHICLES',vehicle)
                resolve(driver)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    addVehicle({ commit }, payload){
       
        const toCreate = {            
            name: payload.vehicle.name,
            plate: payload.vehicle.plate,
            actived: payload.vehicle.actived,
            model: payload.vehicle.model,
            type_id: payload.vehicle.type_id,
            capacity: payload.vehicle.capacity,
            color: payload.vehicle.color,
            distributor_id: payload.vehicle.distributor_id,
            tecnico_mecanica_date_expire: payload.vehicle.tecnico_mecanica_date_expire,
            soat_date_expire: payload.vehicle.soat_date_expire,
            source_address: payload.vehicle.source_address,
            destination_address: payload.vehicle.destination_address,
        }

        return new Promise((resolve,reject) => {

            Service.Vehicles().store(toCreate).then(response => {
                
                const vehicle = response.data.data

                commit('SET_VEHICLES',vehicle)
                resolve(vehicle)
            }) .catch(error =>{
                reject(error)
            })
        })
        
    },
    getVehiclesTypes({ commit }){        
        
        return new Promise((resolve,reject) => {
            Service.VehiclesTypes().getAll().then(response => {
                const vehiclesTypes = response.data.data
                commit('SET_VEHICLES_TYPES',vehiclesTypes)
                resolve(vehiclesTypes)
            }).catch(error =>{
                reject(error)
            })
        })
    },
    getVehiclesColors({ commit }){        
    
        return new Promise((resolve,reject) => {
            Service.VehiclesColors().getAll().then(response => {
                const vehiclesColors = response.data.data
                commit('SET_VEHICLES_COLORS',vehiclesColors)
                resolve(vehiclesColors)
            }).catch(error =>{
                reject(error)
            })
        })
        
    },
    getProductsPartnerCategorie({ commit, state }, categorie) {      

        Service.productsPartnerCategorie().getAll(state.partner.id, categorie).then(response => {
            const products = response.data.data
            commit('SET_PRODUCTS_PARTNER_CATEGORIE',products)
        })
    },
    getAditionalsProduct({ commit }, product) {      

        const url = `aditionals?search=${product}&columns=product_id`

        Service.Aditionals(url).getAllProduct().then(response => {
            const aditionals = response.data.data
            commit('SET_ADITIONALS_PRODUCT',aditionals)
        })
    },
    setFfilterStatus({ commit }, payload){
        commit('SET_FILTER_STATUS',payload)
    },
    updateProduct({ commit }, payload){

        

        const toUpdate = {
            ...payload.order
        }

        
        Service.Products().update(payload.order.id,toUpdate).then(response => {
            //const aditionals = response.data.data
            //commit('SET_ADITIONALS_PRODUCT',aditionals)
        })
        
    },    
    showMenuAppsToggle({commit}, data){
        commit('SHOW_OPEN_MENU_APPS',data)            
    },
    showleftSideMenuToggle({commit},data){
        commit('SHOW_OPEN_LEFT_SIDE_MENU_APPS',data)            
    }
}

const mutations = {     
    SHOW_OPEN_LEFT_SIDE_MENU_APPS(state,data){
        state.showleftSideMenu = data
    },
    SHOW_OPEN_MENU_APPS(state,data){
        state.menuAppsShow = data
    },
    SET_FILTER_STATUS(state, data){
        state.filterStatus = data
    },
    SET_PRE_ORDERS(state, data){
        state.preOrders = data
    },
    SET_VEHICLES_COLORS(state, data){
        state.vehiclesColors = data
    },
    SET_VEHICLES_TYPES(state, data){
        state.vehiclesTypes = data
    },
    SET_VEHICLES_AVAILABLE(state, data){
        state.vehiclesAvailables = data
    },
    SET_VEHICLES(state, data){
        state.vehicles = data
    },
    SET_ROUTE_PLANS(state, data){
        state.routePlans = data
    },
    SET_ROUTE_PLANS_BY_DATE(state, data){
        state.routePlansToday = data
    },
    SET_DISTRIBUTORS(state, data){
        state.distributors = data
    },     
    SET_CURRENT_ORDER_SHOW(state,data){
        state.currentOrder = data
    },
    SET_TOGGLE_MODAL_NEW_ORDER(state,data){
        state.showModalNewOrder = data
    },
    SET_IS_LOGGED(state,date){
        state.isLoggedIn = date
    },
    SET_AUTH_TOKEN(state,token){
        state.authToken = token
    },
    SET_ADITIONALS_PRODUCT(state,data){
        state.aditionals = data
    },
    SET_PRODUCTS_PARTNER_CATEGORIE(state,data){
        state.productsPartnerCategorie = data
    },
    SET_CATEGORIES(state,data){
        state.categories = data
    },
    SET_PARTNER_STATUSES(state,data){
        state.partnerStatuses = data
    },
    // SET_DISTRIBUTOR_ORDER(state){
    //     state.order.distributor_id = 1
    // },
    SET_PARTNER(state, partner){
        state.partner = partner
    },
    SET_USER_AUTH(state, user){
        state.authUser = user
    },
    SET_REASONS_DECLINE_ORDERS(state, data){
        state.reasonsDeclineOrders = data
    },
    SET_DISTRIBUTOR_ORDER(state, order) {
        const changeOrders = state.ordersAccepted.filter((item) => {
            return (item.id != order.id)
        })
        state.ordersAccepted = changeOrders
        state.ordersAccepted.push(order)
    }, 
    SET_ACCEPT_ORDER(state, order) {
        state.ordersPending = state.ordersPending.filter((item) => {
            return (item.id != order.id)
        })

        order.status_id = 2
        
        state.ordersAccepted.push(order)
    },    
    SET_DECLINE_ORDER(state, order) {
        state.ordersPending = state.ordersPending.filter((item) => {
            return (item.id != order.id)
        })
    },    
    SET_PENDING_ORDERS(state, data){
        state.ordersPending = data
    },
    SET_ACCEPTED_ORDERS(state, data){
        state.ordersAccepted = data            
    },
    SET_PARTNER_STATUS(state, status){  
        state.partner.status = status
    },
    updateValue (state, value) {
        state.value = value
    },
    loading(state, isLoading) {
        state.loading = isLoading
    },
    playerShow(state) {
        state.modalVisible = true         
    },
    playerHide(state) {
        state.modalVisible = false
    },
    toggleShowModal(state){
        state.showModal = !state.showModal
    }
}

const getters = {
    isLoggedIn: state => !!state.authToken,    
    colorsAvailables: state => {
        const colors = state.vehiclesColors.map((color) => {
            return `#${color.value}`
        })          
        
        return colors
    }
}

export const store = new Vuex.Store({    
    state,
    actions,
    mutations,
    getters,
    modules: {
        modals: storeModals,
        leftMenuItems:storeleftMenuItems
    },
    plugins: [
        createPersistedState({
            paths: ['authUser','authToken','isLoggedIn'],
            storage: {
                getItem: (key) => ls.get(key),
                setItem: (key, value) => ls.set(key, value),
                removeItem: (key) => ls.remove(key),
            },
        })
    ]
})