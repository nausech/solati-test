<template>
    <div>
        <template v-if="loading" >
            <Loading></Loading>
        </template>

        <template v-else>

            <div class="row mb-15">
    
                <div class="col-md-6">
                    
                    <div v-if="searchable" class="form-inline">
                        <div class="form-group relative">
                            <input :placeholder="$t('Search for anythings')" v-debounce:1000ms="sendSearch" v-model="querySearch" type="text" class="pr-15 form-control">                                   
                            
                            <span v-show="!querySearch" class="link-pointer mdi right-12 mdi-magnify absolute"></span>

                            <span v-show="querySearch" @click="resetFilter" class="link-pointer mdi right-12 mdi-close absolute"></span>
                        </div>                  
                    </div>
                </div>
                

                <div class="col-md-6 text-right pt-1">
                        
                        <!--
                        <download-excel
                            class = "btn-sm btn btn-success ml-1"
                            :fetch   = "fetchData"
                            :fields = "columnsForExcel">                        
                            <span class="mdi mdi-file-excel-box"></span>
                        </download-excel>
                        -->
                        
                        <button type="button" @click="getRows" class="btn-sm btn btn-success ml-1">                            
                            <span class="mdi mdi-refresh"></span>
                        </button>   
                        
                        <!--
                        <template v-if="buttons" v-for="button in buttons">
                            <button type="button" :class="button.class" @click="button.action()">
                                <div v-html="button.text"></div>
                            </button>
                        </template>
                        -->

                        <template>
                            <slot name="pagination_buttons" ></slot>    
                        </template>

                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <table class="table table-sm" cellspacing="0" width="100%">
                        <thead>
                            <th :key="col.field" class="text-left" v-for="col in cols">{{$t(col.label)}}</th>
                            <th v-if="actions" class="pr-0 text-right">Actions</th>
                        </thead>
                        <tbody>
                            <tr :key="index" v-for="(item,index) in rows">
                               
                                <td :key="index" v-for="(col,index) in cols" class="text-left">
                                    <div @click="callfunction(item,col)" v-html="col.render ? col.render(collectFormatted(item,col),item) : collectFormatted(item,col)"></div>
                                </td>
                                
                                <td  class="pr-0 text-right">
                                    
                                    <div class="row">
                                        <div class="col d-inline">
                                            
                                            <router-link v-if="actionsEdit" class="btn-sm btn btn-success mr-1" :to="{ name: `${uri}-id`, params: { id: item._id }}">
                                                <span class="text-white mdi mdi-pencil"></span>
                                            </router-link>

                                                
                                            <button v-if="actionRemove" class="btn btn-sm btn-danger mr-1" @click="delete_item(item.id)" >
                                                <span class="text-white mdi mdi-trash-can"></span>
                                            </button>
                                            
                                            

                                            <template>
                                                <slot :item="item" name="pagination_actions"></slot>    
                                            </template>
                                        </div>
                                    </div>
                                    
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table> 
                </div>
            </div>

            <div v-if="paginable" class="row">
                <div class="col-md-4">
                    <div  class="form-inline">

                        <span class="small mr-2">{{$t("Show")}} </span>

                        <div class="form-group mr-2">
                            <select v-model="ShowEntries" @change="changeEntries(ShowEntries)" class="form-control">                                                                                                
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="15">15</option>
                                <option value="30">30</option>
                                <option value="50">50</option>
                            </select>
                        </div>

                        <span class="small">{{$t("Rows")}}</span>

                    </div>
                </div>
                
                <div class="col-md-4">
                    
                    <div  class="custom-showing text-center">
                        <span class="small text-default px-1">{{$t("Showing")}} {{this.pagination.from || 1}} {{$t("to")}} {{this.pagination.to}} {{$t("of")}} {{this.pagination.total}} {{$t("entries")}}</span>
                    </div>
                    
                </div>
                <div class="col-md-4">
                    <nav class="float-right">
                        <ul class="pagination mb-0 small">
                                    
                            <li class="page-item" :class="{'disabled':pagination.current_page == 1}">
                                <a @click.prevent="changePage(pagination.current_page - 1)" class="text-secondary page-link" href="#" aria-label="Previous">                                
                                    <span aria-hidden="true">« {{$t("Previous")}}</span>    
                                </a>
                            </li>
                            
                            <li :key="page" v-for="page in pagesNumber" :class="{'active': page == pagination.current_page}">
                                <a class="text-secondary page-link" @click.prevent="changePage(page)" href="#">{{ page }}</a>
                            </li>
                                                        
                            <li class="page-item" :class="{'disabled':pagination.current_page == pagination.last_page}">
                                <a @click.prevent="changePage(pagination.current_page + 1)" class="text-secondary page-link" href="#" aria-label="Next">                                
                                    <span aria-hidden="true">{{$t("Next")}} »</span>   
                                </a>
                            </li>  
                        </ul>
                    </nav>
                </div>
            </div>
        </template>
    </div>
</template>

<script>
import Loading from "./Loading";
import Vue from 'vue';

//packages dependendies
import VueSweetalert2 from 'vue-sweetalert2'
import vueDebounce from 'vue-debounce';
import JsonExcel from 'vue-json-excel';

Vue.use(VueSweetalert2);
Vue.use(vueDebounce);

export default {
    name: 'DataTable',    
    components: {  
        Loading,
        'downloadExcel':JsonExcel
    },
    data(){
        return {            
            querySearch:'',
            Page: 1,
            ShowEntries: 10,
            offset:2,
            pagination:{},
            rows:[],
            loading:false            
        }
    },
    props:{        
        isPagination: {
            type:Boolean,
            default: true
        },
        buttons:{
            type:Array,
            required:false
        },
        searchable:{
            type:Boolean,
            default: true
        },
        paginable:{
            type:Boolean,
            default: true
        },
        columns:{
            type:Array,
            requied:true
        },
        actionsEdit:{
            type: Boolean,
            default: true
        },
        actionRemove:{
            type: Boolean,
            default: true
        },
        actions: {
            type: Boolean,
            default: true
        },
        uri: {
            type: String,
            required: true
        },
    },
    computed : {        
        columnsForExcel(){
                        
            let results = this.columns.map(function(item){
                return `"${item.label}":"${item.field}"`
            }).join(',')

            return JSON.parse(`{${results}}`)
        },        
        pagesNumber () {
            if (!this.pagination.to) {
                return []
            }
            
            let from = parseInt(this.pagination.current_page) - this.offset

            if (from < 1) {
                from = 1                
            }

            let to = from + (this.offset * 2)

            if (to >= this.pagination.last_page) {
                to = this.pagination.last_page
            }
            let pagesArray = []
            for (let page = from; page <= to; page++) {
                pagesArray.push(page)
            }
            return pagesArray
        },
        cols () {
            let app = this
            return app.columns.map(item => {
                if (item.type) item.typeDef = app.dataTypes[item.type]
                return item
            })
        },
        
    },
    created(){
        this.getRows()
    },   
    methods:{     

        callfunction(item,col){
            if (col.action){
                col.action(item)
            }
        },
        getRows(){
            
            this.url = `${this.uri}?&pagination=${this.paginable}&page=${this.Page}&per_page=${this.ShowEntries}&search=${this.querySearch}`
            
            this.loading = true
            axios.get(this.url).then(response => {
                this.loading = false

                this.pagination = response.data.pagination
                this.rows = response.data.data
            })
        },
        async fetchData(){

            this.loading = await true

            const response = await axios.get(`${this.uri}`)

            this.loading = await false
            
            return response.data.data
        },
        resetFilter(){
            this.querySearch = ''            
            this.getRows()
        },
        changeEntries (value) {
            this.ShowEntries = value            
            this.getRows()
        },
        sendSearch(){
            this.Page = 1            
            this.getRows()
        },
        changePage (page) {
            this.Page = page            
            this.getRows()
        },        
        delete_item(id){
            this.$swal({
                title: this.$t('Are you sure to delete this record ?'),
                text: this.$t("This action will eliminate all dimensions"),
                type: 'question',
                customClass: 'bg-body',
                showCancelButton: true,
                confirmButtonClass: 'btn btn-success font-weight-light',
                cancelButtonClass: 'btn btn-danger font-weight-light',
                confirmButtonColor: '#53D190',
                cancelButtonColor: '#F65F6E',
                confirmButtonText: this.$t('¡Yes, delete!')
            }).then((result) => {
                if (result.value) {
                    
                    axios.delete(`${this.uri}/${id}`).then(response => {                        
                        
                        this.rows = this.rows.filter(item => item.id != id)

                        this.$swal({
                            title: this.$t('Deleted')+'!',
                            text: this.$t(response.data.message),
                            type: 'success',
                            customClass: 'bg-body rounded-0',
                            confirmButtonClass: 'btn btn-primary font-weight-light',
                        })
                       
                    })
                }
            })
        },
        collectFormatted (obj, column) {            

            let value
            value = this.collect(obj, column.field)
            if (value === undefined) return ''
            // lets format the resultant data
            const type = column.typeDef

            if (typeof type !== 'undefined' && value != '') {
                return type.format(value)
            }

            return value
        },
        collect (obj, field) {
            // utility function to get nested property
            function dig (obj, selector) {
                let result = obj
                const splitter = selector.split('.')
                for (let i = 0; i < splitter.length; i++) {
                if (typeof result === 'undefined') {
                    return undefined
                }
                result = result[splitter[i]]
                }
                return result
            }

            if (typeof field === 'string') return dig(obj, field)
            return undefined
        },
    }
}
</script>


<style scoped>
    th{
        font-size: 14px !important;
    }

    li.active a{
        background-color: #0a5fd8 !important;
        color:#fff !important;
    }

    .custom-pagination{
        margin: 0 !important;
    }

    .custom-showing{
        line-height: 36px !important;
    }

    .absolute{
        position: absolute
    }

    .relative{
        position: relative
    }

    .pr-15{
        padding-right: 15; 
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
    .icon-search{
        color: #636b6f !important;
    }

    .link-pointer{
        cursor: pointer;
        top: 18px;
    }
</style>
