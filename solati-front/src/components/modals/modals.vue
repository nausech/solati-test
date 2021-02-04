<template>
    <div>

        <modal-search :title="title" :options="options" @selected="selected" v-if="showSearch" @closeModals="$emit('update:showModals',false)" @openModalCreate="openModalCreate">

        </modal-search>

        <modal-create :title="title"  v-if="showCreate" @closeModals="$emit('update:showModals',false)">
            <slot name="bodyCreate" slot="body"></slot>
            <slot name="buttonCreate" slot="button"></slot>
        </modal-create>

        <!--<modal-image></modal-image>-->

        <div class="h-100 left position-fixed top w-100 z-index-3 opacity-modal"></div>
    </div>
</template>

<script>
import modalImage from './modalimage'
import modalCreate from './modalcreate'
import modalSearch from './modalsearch'

export default {
  name: 'modals',

  components: {
    modalCreate,
    modalSearch,
    modalImage
  },
  props: {
    showSearch: Boolean,
    showCreate: Boolean,
    showModals: Boolean,
    options: Array,
    title: String
  },
  data () {
    return {}
  },

  watch: {

  },

  created () {
    this.$store.commit('set_blur', false)
  },
  mounted () {

  },
  destroyed () {
    this.$store.commit('set_blur', false)
  },
  methods: {
    selected (value) {
      this.$emit('selected', value)
    },
    openModalCreate () {
      this.$emit('update:showSearch', false)
      this.$emit('update:showCreate', true)
    }
  }
}
</script>

<style scoped>

</style>
