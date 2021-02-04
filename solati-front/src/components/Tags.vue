<template>
    <div>
        <div class="tags-container">
            <span :key="index" v-for="(tag,index) in tags" class="p-2 badge badge-success float-left mr-1">
                {{tag}} <span style="cursor:pointer" @click="removeTag(index)" class="mdi mdi-close"></span>
            </span>                                    
            
            <input class="tag-input-add" :placeholder="$t('new tags here')" @keyup="addTag" type="text" >
        </div>
    </div>
</template>

<script>

export default {
    name:'Tags',
    props: {
        model: {
            required: true
        }
    },
    watch:{
        model(newVal) {
            if (typeof(newVal) == 'string'){
                if (newVal.length > 0){
                    this.tags = newVal.split(',')
                }
            }
            else{
                this.tags = newVal
            }
        }
    },
    data(){
        return {            
            tags: []
        }
    },
    created(){        

        if (typeof(this.model) == 'string'){
            if (this.model.length > 0){
                this.tags = this.model.split(',')
            }
        }
        else{
            this.tags = this.model
        }
    },
    methods:{
        removeTag(index){
            this.tags = this.tags.filter((item,i)=>{
                return (i !== index)
            })

            this.$emit('update:model',this.tags)
        },
        addTagArray(value){
            this.tags.push(value)
            this.$emit('update:model',this.tags)
        },
        addTag(e){
            const value = e.target.value.replace(',','')            

            if (e.keyCode === 8){
                // delete tags item backspace key
            
                if (value.length == 0 ){                                        
                    this.tags.pop();
                    this.$emit('update:model',this.tags)                 
                }
            }            
            else if (e.keyCode === 13){
                // delete tags item enter key
                if (value.length > 0 ){                    
                    this.addTagArray(value)
                    this.$emit('update:model',this.tags)
                    e.target.value = ''                    
                }
            }
            else{
                if (e.target.value.indexOf(',') > -1){                                    
                    if (value.length > 0){
                        this.addTagArray(value)         
                        this.$emit('update:model',this.tags)           
                        e.target.value = ''                        
                    }
                }
            }
        }
    }
}
</script>

<style scoped>
    .tag-input-add{
        width: 150px !important;
        color: #495057 !important;
        margin-top: 2px !important;
        padding:0 !important;
        padding-left: 10px !important;
        font-size: 1rem !important;
        border:none !important;
    }

    .tags-container{
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: 0.25rem;        
        padding: 8px;
        padding-top:5px;
    }
</style>