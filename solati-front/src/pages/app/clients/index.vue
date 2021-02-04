
<template>
    <div  class="bg-white row m-3 pb-3 shadow rounded">
        <div class="col-xl-12 col-sm-12 col-md-12 pr-0">       
             <div class="pl-3 pt-3 pr-3">     
                   
                <pagination :isPagination="isPagination" :actionsEdit="false" :actions="actions" :searchable="searchable" :uri="uri" :columns="columns">

                  
                    
                    
                    <template v-slot:pagination_actions="{ item }"> 
                        <button @click="openModal(item)" class="btn-sm btn btn-success mr-1">
                            <span class="text-white mdi mdi-pencil"></span>
                        </button>    
                    </template>

                    
                </pagination>
             </div>
        </div>           
       
        
    </div>
</template>

<script>
import moment from 'moment'
import updateOrCreateRightModal from './updateOrCreateRightModal'

export default {
    components:{      
      updateOrCreateRightModal
    },
    name:'History',    
    data(){
        return {        
            forceRerenderCount:0,                
            vehicleSelected:null,
            isPagination:false,
            actions:false,
            searchable:true,
            uri: `client`,      
            columns: [
                {
                    label: '#',
                    field: 'id'
                },
                {
                    label: 'NIT',
                    field: 'nit'
                },
                {
                    label: 'Nombre',
                    field: 'name'
                },
                {
                    label: 'Email',
                    field: 'email'
                },
                {
                    label: 'Dirección',
                    field: 'address'
                },     
            ],
        }
    },        
    created(){        
        moment.locale('es')
    },
    methods: {               
        
    }
}
</script>

<style>

</style>