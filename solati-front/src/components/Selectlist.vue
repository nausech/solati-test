<template>
    <div>

       <multiselect 
            v-model="value"
            :placeholder="placeHolder" 
            :label="label" 
            :track-by="trackBy" 
            :allow-empty="allowEmpty"
            :close-on-select="closeOnSelect"
            :options="options" 
            :multiple="multiple" 
            :searchable="searchable"
            :taggable="taggable"
            @input="selectionChange">
        </multiselect>

    </div>
</template>

<script>
import Multiselect from 'vue-multiselect'

export default {
    components: {
        Multiselect
    },
    name: 'Selectlist',
    props: {
        model: {
            required: true
        },
        options: {
            required: true,
            type: Array
        },
        multiple:{
            default () {
                return true
            }
        },
        searchable:{
            default () {
                return true
            }
        },
        closeOnSelect:{
            default () {
                return true
            }
        },
        allowEmpty:{
            default () {
                return false
            }
        },
        taggable:{
            default () {
                return false
            }
        },
        label: {
            default () {
                return 'name'
            }
        },
        placeHolder: {
            default () {
                return 'Search an option'
            }
        },
        trackBy:{
            default(){
                return 'id'
            }
        }
    },
    mounted(){
        this.value = this.model
    },
    data () {
        return {
            value: ''
        }
    },
    methods:{
        selectionChange(value){
            this.$emit('update:model',value)
        }
    }
   
}

</script>

<style scope>
@import '~vue-multiselect/dist/vue-multiselect.min.css';
          
/*
.multiselect__option--selected.multiselect__option--highlight{
    background: #ff7588;
}

.multiselect__option--highlight{
    background: #16d39a;
}
*/

.multiselect__tags .multiselect__input{
 
    border: 0 !important;   
    border: 0px solid #e7e7e7 !important;
    border-color: transparent !important; ;
 
}


.multiselect__input:focus{
    background-color : transparent;
    border: 0 !important;   
    border: 0px solid #e7e7e7 !important;
    border-color: transparent !important; ;
    padding: 5px !important;    
    margin: 0px !important; ;
}

</style>