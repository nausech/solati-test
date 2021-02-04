<template>
    <transition name="slide-fade">

        <div v-if="showCreate"  id="modal-create-item" class="bg-white h-100 position-fixed right top z-index-4 modal-create">

            <div class="bg-primary d-flex px-4 py-3 ">
                <h5 class="font-weight-normal col mb-0 text-white">{{title}}</h5>
                <button type="button" @click="closeModals" class="close float-right font-weight-light text-white">
                    <span class="float-right pr-3 ti-close"></span>
                </button>
            </div>
            <div class="position-relative px-5 body">
                <div class="">
                    <slot name="body"></slot>
                </div>
            </div>
            <div class="z-index-1 bg-light border-secondary border-top bottom flex flex-center position-absolute w-100 px-4 py-3">
                <div class="d-flex justify-content-around w-100 preview-buttons-container">
                    <div class="">
                        <slot name="button"></slot>
                    </div>

                    <button @click="closeModals" :showModalsPreview="false" class="btn-outline-primary btn-minw btn-preview-edit py-2 px-3 small  d-flex align-items-center justify-content-center">
                        <span class="ti-close  mr-2 rounded view text-default preview-icon "></span>Cancel
                    </button>

                </div>
            </div>
        </div>
    </transition>
</template>

<script>
import delay from 'lodash/delay'
export default {
  name: 'modalcreate',
  props: {
    title: String
  },
  data () {
    return {

      showCreate: false,
      showModals: false,
      loaded: false,
      showModalsPreview: false
    }
  },
  mounted () {
    this.showCreate = true
  },

  methods: {
    create () {
      this.$emit('create')
    },
    closeModals () {
      this.showCreate = false
      delay(() => {
        this.$emit('closeModals')
      }, 700)
    }

  }
}

</script>
<style lang="scss">
    .modal-create{
        width: 500px;

        .body{
            overflow-y: scroll;
            height:     100%;
        }

        .form-control{
            padding-bottom: 0.375rem !important;
            &.is-invalid{
                border-color:        #F04A58;
                border-width:        2px;
                border-bottom-color: #F04A58 !important;
                border-bottom-width: 2px !important;
                &:focus{
                    border-color: transparent !important;
                }
            }
        }
        .open-indicator{
            background-color: transparent !important;
        }
        .v-select .selected-tag{
            z-index:      1;
            color:        #6B757C;
            font-weight:  400;
            /*font-size:    85% !important;*/
            padding-left: 0 !important;
        }
    }

    #modal-create-item{
        .text-danger{
           /* height:        38px;*/
            float:         none !important;
            margin-left:    0!important;
            position:absolute;
            right:0;
        }
        .dropdown-toggle{
            input{
                /*height:38px !important;*/
            }

        }
        .info-collapse{
            .dropdown-toggle{
                input{
                    height: initial !important;
                }

            }

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
        transform: translateX(37px);
        opacity:   0;
    }
</style>

<style lang="css">
    .rounded-icon{
        background: #6063c1;
        border-radius: 100%;
        color: white;
        font-weight: bold;
        padding: 4px;
        font-size: 8px;
        margin-right: 5px;
        text-align: center;
        display: flex;
        align-items: center;
    }

    .modal-create .form-control{
        padding-left: 0;
        /*font-size:12px;*/
    }

</style>
