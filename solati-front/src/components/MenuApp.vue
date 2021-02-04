
<template>
    <div >
       
        <RightModal modalName="MenuApp" title="Player" >
            
            <template slot="title">                  
                
            </template>

            <template slot="close_button">           
                <button @click="closeModal" type="button" class="close" aria-label="close">
                    <span class="mdi-28px mdi mdi-chevron-left"></span>
                </button> 
            </template>

            <template slot="body">                                  
                                    
                <div  class="row">
                    <div class="col-4 text-center pt-3" v-for="(app, index) in apps" :key="index">
                        
                        <a class="cursor-pointer" @click="goApp(app)">                                
                            <span style="color:#01274C"  :class="app.iconClass"></span>  
                            <p class="mt-0">
                            {{ app.name }} 
                            </p>   
                        </a>
                        
                    </div>
                </div>

            </template>
        </RightModal>
        

    </div>
</template>

<script>
import RightModal from '@/components/RightModal'


export default {
    components:{
        RightModal
    },
    name:'MenuApp',
    data(){
        return {
            apps:[                
                {name:'Categorías', menu:'categories',routerName:'categories', iconClass:'mdi mdi-38px mdi-archive'},
                // {name:'Inventario', menu:'inventories',routerName:'inventories', iconClass:'mdi mdi-38px mdi-package-variant'},
                // {name:'Ventas',menu:'inventories', routerName:'vehicles', iconClass:'mdi mdi-38px mdi-chart-line'},                
                // {name:'Agendamiento',menu:'scheduling', routerName:'scheduling', iconClass:'mdi mdi-38px mdi-calendar-multiple-check'},                
                // {name:'Empresa', menu:'inventories',routerName:'vehicles', iconClass:'mdi mdi-38px mdi-domain'},                
            ]
        }
    },
    created() {        
        //
    },
    computed: {
        //
    },
    props:{
        //
    },
    methods:{   
        goApp(app){
            this.showAppsMenu = !this.showAppsMenu                   
            this.$store.dispatch('showMenuAppsToggle',false)
            
            this.$store.dispatch('modals/showModalToggle','MenuApp') 

            this.$router.push({name:app.routerName})
        },   
        closeModal(){            
            this.$store.dispatch('modals/showModalToggle','MenuApp')    
        }            
    }
}
</script>