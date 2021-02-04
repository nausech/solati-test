<template>
    <section v-if="open">
        <div class="modal-create modal-search">
            <transition name="slide-fade">
                <div class="bg-white col-12 col-sm-6 col-xl-4 left mt-5 mx-auto position-fixed right top z-index-4">
                    <div class="bg-primary d-flex px-4 py-3 row">
                        <h5 class="font-weight-normal col mb-0 text-white">Create new {{name | capitalize}}
                        </h5>
                        <button type="button" @click="$emit('update:open',false)" class="close float-right font-weight-light text-white">
                            <span class="float-right pr-3">×</span>
                        </button>
                    </div>
                    <div class="position-relative px-4 row">
                        <div class="col  create-form">
                            <div class="mt-4 pb-1 align-items-center border-bottom">
                                <label class="font-weight-normal mb-0 small text-primary">{{name | capitalize}}:</label>
                                <input v-model="form.name" :placeholder="'Enter the new ' + name" type="text" class=" border border-bottom border-left-0 border-right-0 border-top-0 form-control rounded-0 bg-transparent">
                            </div>
                        </div>
                        <div v-if="value" class="col create-form ">
                            <div class="mt-4 pb-1 align-items-center border-bottom">
                                <label class="font-weight-normal mb-0 small text-primary">Value:</label>
                                <input v-model="form.value" placeholder="Enter a value" type="text" class=" border border-bottom border-left-0 border-right-0 border-top-0 form-control rounded-0 bg-transparent">
                            </div>
                        </div>

                    </div>
                    <div class=" col-12 text-center">
                        <button @click="create" class="m-4 btn-primary btn-minw btn rounded-0">
                            Create
                        </button>
                    </div>
                </div>
            </transition>
        </div>
        <div class="h-100 left position-fixed top w-100 z-index-3 opacity-modal"></div>
    </section>
</template>

<script>

  import api from '../../../config/api'

  export default {
    name: "modalcenter",
    props: {
      uri: {
        type: String,
        required: true,
      },
      valueId: {
        type: Number,
      },
      name: {
        type: String,
        required: true,
      },
      open: {
        type: Boolean,
        default: () => false
      },
      value:{
        type: Boolean,
        default: () => false
      }

    },
    data () {
      return {form: {name: null,value:null}}
    },
    methods: {
      create () {
        api.Any(this.uri).create(this.form).then(response => {
          api.SuccessResponse(response)
          this.form.name=null
          this.$emit('update')
          this.$emit('update:open',false)
          setTimeout(()=>{
            this.$emit('update:valueId',response.data.data.id)
          }, 800)


        })
      }
    }


  }
</script>

<style scoped>

</style>