<template>
  <div :id="id" class="modal opacity-modal fade note-editor modal-image-upload" :class="id">
    <div class="modal-dialog">
      <div class="modal-content mx-auto rounded-0 w-75">
        <div class="px-5 modal-header rounded-0 bg-secondary text-white">
          <h5 class="modal-title font-weight-normal">Upload a Picture</h5>
          <button type="button" class="close" data-dismiss="modal">
            <span class="text-white font-weight-light">×</span>
          </button>
        </div>
        <div class="align-items-center modal-body mt-2 px-5 row">
          <div class="col-sm">
            <progressive-img :aspect-ratio="1" :src="src" class="d-flex img-thumbnail info-img-lg mx-auto my-3 rounded-circle"/>
          </div>
          <div class="col-sm">
            <label :for="'file'+id" class="align-items-center btn-primary cursor-pointer d-flex mx-3 px-3 py-2 rounded-0 small text-white">
              <span class="ion ion-image"></span> Choose a File</label>
            <input accept="image/*" class="d-none" ref="file" :id="'file'+id" type="file" @change="onFileChange">
          </div>
        </div>
        <div class="px-5 col-12 clearfix pt-3 border-top modal-footer justify-content-center">
          <button @click="confirmImage" :disabled="!imageChange" class="small btn-minw rounded-0 px-3 py-2 btn btn-primary btn-sm mr-3  save-note button-validate">
            <font-awesome-icon v-if="loading" icon="circle-notch" class="mr-2" spin/>
            Confirm
          </button>
          <button @click="cancelImage" class="small btn-minw rounded-0 px-3 py-2 btn btn-outline-primary btn-sm discard" data-dismiss="modal">
            Cancel
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import api from './../../../config/api'
export default {
  name: 'modalimage',
  props: {
    id: {
      type: [Number, String],
      default () {
        return _.sampleSize('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 5).join('')
      }

    },
    image: String,
    url: {
      required: true
    }
  },
  data () {
    return {
      imageChange: false,
      src: this.image,
      loading: false,
      showModal: false
    }
  },
  watch: {
    image (value) {
      this.src = value
    }
  },
  methods: {
    onFileChange (event) {
      this.imageChange = true

      let input = event.target
      // Ensure that you have a file before attempting to read it
      if (input.files && input.files[0]) {
        // create a new FileReader to read this image and convert to base64 format
        let reader = new FileReader()
        // Define a callback function to run, when FileReader finishes its job
        reader.onload = (e) => {
          // Note: arrow function used here, so that "this.imageData" refers to the imageData of Vue component
          // Read image as base64 and set to imageData
          this.src = e.target.result
        }
        // Start the reader job - read file as a data url (base64 format)
        reader.readAsDataURL(input.files[0])
      }
    },
    cancelImage () {
      this.imageChange = false
      this.src = this.image
    },
    confirmImage () {
      this.loading = true

      let document = this.$refs.file

      let formData = new FormData()

      formData.append('image', document.files[0])

      api.Images().create(formData).then(response => {
        api.SuccessResponse(response)
        api.Any(`${this.url}/${this.id}/images`).update(response.data.data.id, {}).then(response => {
          this.$emit('changeImage', response.data.data.url)
          this.loading = false
          this.imageChange = false
          this.showModal = false
          console.log('hola')
          $('.modal-image-upload').modal('hide')

          console.log(response.data.data)
        }).catch(error => {
          api.ErrorResponse(error)
          this.loading = false
        })
      }).catch(error => {
        api.ErrorResponse(error)
        this.loading = false
        this.imageChange = false
      })
    }
  }
}
</script>

<style scoped>

</style>

<style lang="scss">
    .modal-backdrop{
        z-index: 0;
    }

    .modal-image-upload .progressive-image{
        height:126px;
        width:126px;
    }
</style>
