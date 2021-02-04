
<template>
    <div class="row mr-0">
        
            <div class="col-sm-12 col-xl-4 col-md-4 pr-0 mr-0">                
                
                   
                <div class="col-md-12 mt-3">
                   
                    <h5>Tracking #{{ orderId }} <!--<small class="text-muted float-right">Entre 3:30pm y 4:30pm</small>--></h5>
                    <div class="progress">
                        <div :style="`width: ${getwidthState(order.status.id)}%;`" style="background-color: rgb(162 145 118) !important" class="progress-bar bg-warning" role="progressbar"  aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <small class="text-muted">{{ $t(order.status.name) }}</small>
                    
                </div>

                <div class="col-12 mt-4 pt-4 border-top">
                    <ul>
                        <li> <h4 class="font-weight-bold">Hola {{ order.name }}</h4></li>
                        <li>Tu pedido #{{ order.pre_order_id }}, realizado del {{ order.date | formatDate('LL') }}</li>                        
                    </ul>
                </div>
                
                <!--
                <div class="col-12 mt-4 pt-4 border-top">
                                        
                    <h5>Estado</h5>
                    <ul class="timeline">
                        <li>
                            <span class="text-dark">Miercoles 5 de Junio de 2020, 12:00pm</span>                                        
                            <p>Su pedido salio de bodega</p>
                        </li>
                        <li>
                            <span class="text-dark">Miercoles 5 de Junio de 2020, 12:00pm</span>                                        
                            
                            <p>En ruta a dirección de despacho</p>
                        </li>
                        <li>
                            <span class="text-dark">Miercoles 5 de Junio de 2020, 12:00pm</span>                                        
                            <p>Pedido programado</p>
                        </li>
                    </ul>                    
                </div>
                -->

                

                <div class="col-12 mt-4 pt-4 border-top">

                    <div class="row">
                        <div class="col-8">
                            <h5>Dirección de despacho</h5>
                            <span> {{ order.address }}</span>
                        </div>

                        <!--
                        <div class="col-4 mt-2">
                            <button class="float-right btn btn-sm btn-success">Editar</button>
                        </div>
                        -->

                        <div class="col-12 mt-2">
                            <h5>Contacto</h5>
                            
                            <span class="mdi mdi-phone mr-3"></span>{{ order.phone }} 
                            
                            <p>
                            <span class="mdi mdi-email mr-3"></span>{{ order.email }}
                            </p>   
                        </div>

                        

                        
                    </div>          
                    
                    
                </div>

                <div class="col-12 mt-5 pt-4 border-top">

                    <div class="row">
                        <!--
                        <div class="col-md-2">
                            <img style="border:3px solid #01274C" class="rounded-circle" width="60" src="https://i.pravatar.cc/300" />
                        </div>
                        -->

                        <div class="col-md-7">
                            <h4 class="font-weight-bold">{{ order.vehicle.distributor.first_name }} {{ order.vehicle.distributor.last_name }}<br>
                            <small> <span class="mdi mdi-success mdi-motorbike"></span> {{ order.vehicle.name}} {{ order.vehicle.plate}}</small></h4>
                        </div>

                        <!--
                        <div class="col-md-3">
                            <span class="text-dark font-weight-bold">Llegara en <br> <small>20 minutos</small></span>
                        </div>
                        -->
                    </div>          
                    
                    
                </div>

               
                <div class="col-12 mt-4 mb-4 pt-4 border-top">

                    <div class="row">
                        <div class="col-12 text-center">                            

                            <h3>Contacto</h3>

                            contacto@thehunt.co
                            <br>
                            ¡Gracias por usar <a target="_blank" href="https://www.thehunt.com.co">www.thehunt.com.co</a>
                        </div>
  
                    </div>          
                    
                    
                </div>
                
            </div>

            <div class="col-sm-12 col-xl-8 col-md-8 pr-0">

                <GmapMap
                    :center="{lat:parseFloat(order.location_lat),lng:parseFloat(order.location_lng)}"           
                    :zoom="12"
                    map-type-id="roadmap"
                    style="width: 100%; height: 93vh;"
                    @click='mark($event)'
                    >

                    
                    <GmapMarker                        
                        
                        :position="{lat: parseFloat(order.vehicle.location_lat), lng: parseFloat(order.vehicle.location_lng)}"                                               
                        :clickable="true"
                        :icon="addIconMarket()"                        
                        :draggable="false"                        
                    /> 

                    <GmapMarker                                                
                        :position="{lat:parseFloat(order.location_lat),lng:parseFloat(order.location_lng)}"                                               
                        :clickable="true"
                        :draggable="true"                        
                    />  
                    
                    <!--  
                    <div v-for="(routes,vehicle_index) in order.route_plans">

                    
                    <GmapMarker                                                
                        :position="{lat:routes.route_plan_steps[0].lat,lng:routes.route_plan_steps[0].lng}"                                               
                        :clickable="true"
                        :draggable="true"                        
                    />
                    
                      
                        
                                
                   
                    <GmapPolyline  :options="{strokeWeight:4, strokeColor:'#f79804'}" :path="routes.route_plan_steps" >
                    </GmapPolyline>
                    

                    

                    </div>
                    -->
                   
                    

                
                    
                    
                </GmapMap>
                
            </div>
        
        
    </div>
</template>

<script>
import Vue from 'vue'
import * as VueGoogleMaps from 'vue2-google-maps';
//import { gmapApi, loaded } from 'vue2-google-maps'
//import { mapState } from 'vuex'
import firebase from 'firebase'

Vue.use(VueGoogleMaps, {
    load: {
      key: 'AIzaSyB8B04MTIk7abJDVESr6SUF6f3Hgt1DPAY',
      libraries: 'places', 
    },
  
    installComponents: true
  })

export default {
    name:'Routes',   
    data(){
        return {
            querySearch:'',            
            colors: [
                '#2E01FF', //blue                
                '#D51600', //red
                '#011627', //darkBlue
                '#4AD1FF', //lightBlue
                '#FF1D15', //ligthRed
                '#279C00', //green
                '#63C414', //lightGreen
                '#9425D2', //violet
                '#F61EA6', //fuchsia
                '#fad23c', //yellow
                '#FF9F1C', //mustard
                '#FF006E', //pink
                '#4ECDC4', //turquoise
                '#264653', //darkTurquoise
                '#F67805', //orange
                '#401f0d', //brown
                '#b4702d', //lightBrown
                '#2b0205' //darkBrown
            ],                        
            markers_polylines:[],
            vehiclesMarkets:[],      
            vehicles:[],
            orderId:null,
            order:{},
            routePlans:[]
        }
    },   
    created(){
        const database = firebase.database()
        const VehiclesRef = database.ref("vehicles")

        VehiclesRef.on('child_changed', (child) => {

            const vehicleChild = child.val()

            if (this.order.vehicle.distributor.id == vehicleChild.id){
                this.order.vehicle.location_lat = parseFloat(vehicleChild.location_lat)
                this.order.vehicle.location_lng = parseFloat(vehicleChild.location_lng)                
            }
        })
    },    
    async mounted(){

        this.orderId = this.$route.params.id

        const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImVtYWlsIjoiYWxlamFuZHJvLmNlcGVkYUB0YXJzLmRldiIsIm5hbWUiOiJBbGVqYW5kcm8gQ2VwZWRhIiwicm9sZV9uYW1lIjoiQWRtaW4iLCJyb2xlX2lkIjoxLCJzY29wZXMiOlsic2hvdzp1c2VycyIsImRlc3Ryb3k6dXNlcnMiLCJzdG9yZTp1c2VycyIsInVwZGF0ZTp1c2VycyJdLCJpYXQiOjE2MDAzODIzNjUsImV4cCI6MTYzMTkzOTk2NX0.pfYmDOdeUu2ayfVY_Mn3QO_b0GdH4gk0ZdHavqkGxXk'
        axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest'
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
        axios.defaults.baseURL = process.env.API_URL
        axios.defaults.withCredentials = true

        const response = await axios.get(`/orders/${this.orderId}`)

        this.order = response.data
        
        this.$gmapApiPromiseLazy().then(() => {  
            //this.$store.dispatch('getRoutePlans')   
            this.goutePlansToday()  
            this.getVehicles()
            //this.$store.dispatch('getVehicles')                    
        })
    },
    computed: {
        
        vehiclesRoutes(){
            
            const vehicles = this.vehicles.filter((vehicle) => {
                return (vehicle.route_plans.length > 0)
            })

            return vehicles
        }
    },
    methods:{        
        async getVehicles(){
            
            const response = await axios.get('vehicles')

        },
        async goutePlansToday(){
            
            const response = await axios.get('route-plans-today')

            this.routePlans = response.data.data            
        },
        getwidthState(state){
            
            if (state == 1){
                return '5'
            }
            else if (state == 2){
                return '10'
            }
            else if (state == 3){
                return '100'
            }            
            
        },
        addLabel(text){
            return {
                text: text,
                color: "white",
                fontWeight: "bold"
            }
        },
        setColor(index){
            return this.colors[index]
        },        
        addIconMarket(){  
            return "https://raw.githubusercontent.com/alejandrocepeda/rutam-images/master/bmw-logo-2020.png"
        },   
        addLabel(text){
            return {
                text: text,
                color: "white",
                fontWeight: "bold"
            }
        },        
    }
}
</script>

<style>
.absolute{
        position: absolute
    }

    .relative{
        position: relative
    }

    .link-pointer{
        cursor: pointer;
        top: 18px;
    }
    .right-12{
        right:12px;
    }

    .top-12{
        top:12px;
    }

    .mb-15{
        margin-bottom: 15px;
    }

    ul.timeline {
        list-style-type: none;
        position: relative;
    }
    ul.timeline:before {
        content: ' ';
        background: #d4d9df;
        display: inline-block;
        position: absolute;
        left: 8px;
        width: 2px;
        height: 100%;
        z-index: 400;
    }
    ul.timeline > li {
        margin: 20px 0;
        padding-left: 30px;
    }
    ul.timeline > li:before {
        content: ' ';
        background: white;
        display: inline-block;
        position: absolute;
        border-radius: 50%;
        border: 3px solid #01274C;
        left: 0px;
        width: 20px;
        height: 20px;
        z-index: 400;
}
</style>