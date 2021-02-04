<template>

  <div class="modal-create modal-search">
    <transition name="slide-fade">
      <div v-if="modal" class="bg-white col-12 col-sm-6 col-xl-4 left mt-5 mx-auto position-fixed right top z-index-4">
        <div class="bg-primary d-flex px-4 py-3 row">
          <h5 class="font-weight-normal col mb-0 text-white">Search {{title}}
          </h5>
          <button type="button" @click="closeModalSearch" class="close float-right font-weight-light text-white">
            <span class="float-right pr-3">×</span>
          </button>
        </div>
        <div class="position-relative px-5 row">
          <form class="col-12 px-0 create-form">
            <div class="mt-4 mb-3">
              <span class="ion ion-ios-search text-primary"></span>
              <label class="font-weight-normal mb-0 small text-primary">Search:</label>
              <v-select class="info-select" :value.sync="form.id" :options="options"></v-select>
            </div>
          </form>
          <div v-if="form.selected" class="col-12 mb-2 px-0"><strong>Results</strong>
            <div class="row align-items-center">
              <div class="col">
                <p class="mb-0">{{form.selected.name}}</p>
              </div>
              <div class="col-auto">
                <button @click="selected" class="btn-primary d-block mx-auto px-3 py-2 rounded-0 small"> Select</button>
              </div>
            </div>
          </div>
          <div class="border col mb-4 mt-3 p-4">
            <p class="small text-center">Can't find the
              <slot name="title"></slot>
              you're looking for?
            </p>
            <button @click="openModalCreate" class="btn-primary rounded-0 py-2 px-3 small mx-auto d-block">
              <span class="ion ion-briefcase"></span> Create a {{title}}
            </button>
          </div>
        </div>
      </div>
    </transition>
  </div>

</template>

<script>
import api from './../../../config/api'
import first from 'lodash/first'
import delay from 'lodash/delay'

export default {
  name: 'modalsearch',
  props: {
    showCreate: Boolean,
    showSearch: Boolean,
    options: Array,
    title: String
  },
  components: {},
  data () {
    return {
      uri: 'leads',
      modal: true,
      loaded: false,
      form: {
        id: null,
        selected: null
      }
    }
  },
  mounted () {
  },
  watch: {
    'form.id': function (value) {
      this.form.selected = first(this.options.filter(item => item.id === value))
    }
  },
  methods: {
    selected () {
      this.$emit('selected', this.form.selected)
      this.closeModalSearch()
    },
    create () {
    },
    zipcode (value) {
      api.Zipcodes().getOne(value.target.value).then(response => {
        this.form.city = response.data.data.city.name
        this.form.state = response.data.data.city.state.name
      })
    },
    openModalCreate () {
      this.modal = false
      delay(() => {
        this.$emit('openModalCreate')
      }, 700)
    },
    closeModalSearch () {
      this.modal = false

      delay(() => {
        this.$emit('update:showSearch', false)
        this.$emit('closeModals')
      }, 700)
    }
  }
}

</script>
<style lang="scss">
  .modal-search .ion{
    width: inherit;
  }

  .modal-create{
    .form-control{
      border-color: #E3E3EF !important;
      /*background-color: #F6F6FD !important;*/
    }
    .open-indicator{
      /*background-color: #F6F6FD !important;*/
    }
    .v-select .selected-tag{
      z-index: 1;
      color:   #495057;
    }
  }
</style>

<style scoped>
  .slide-fade-enter-active{
    transition: all .5s ease;
  }

  .slide-fade-leave-active{
    transition: all .6s cubic-bezier(1.0, 0.5, 0.8, 1.0);
  }

  .slide-fade-enter, .slide-fade-leave-to
    /* .slide-fade-leave-active below version 2.1.8 */ {
    transform: translatey(-37px);
    opacity:   0;
  }
</style>
