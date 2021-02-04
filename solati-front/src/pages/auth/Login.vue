<template>
    <div>
        <div class="d-flex align-items-center auth-login">
            <div class="row w-100 mx-auto">
                    
                <div style="background-color: #fff;border-radius: 8px;" class="border-5 col-xl-4 col-md-7 col-sm-12 mx-auto p-4">
                            
                    <div class="auto-form-wrapper"> 
                            
                            <h4 class="text-center mt-4 mb-5 page-title">
                                <img width="70" :src="require('@/assets/img/logo-solati.png')" alt="">
                                <h5 class="mt-3">Acceder</h5>
                                </h4>      

                                <div class="form-group">
                                    <label for="">Email</label>
                                    <div class="" :class="{'is-danger': errors.email }">
                                        
                                        <input class="form-control" v-model="form.email" type="email" placeholder="Tu email">
                                    </div>
                                    <span v-if="errors.email" class="text-danger float-left small">{{ errors.email }}</span>
                                </div>

                                <div class="form-group ">
                                    <label for="">Contraseña</label>
                                    <div class="position-relative " :class="{'is-danger': errors.password }">                                        
                                        <input style="margin-top: 0px !important;"  class="w-100 form-control" v-model="form.password" :type="`${(showPassToggle == false ? 'password': 'input')}`" placeholder="Tu contraseña">
                                        <span :class="`${(showPassToggle == false ? 'mdi-18px mdi-eye-off-outline': 'mdi-18px mdi-eye-outline')}`" @click="showPass()" style="right:10px; top:7px" class="cursor-pointer text-dark position-absolute mdi"></span>
                                    </div>
                                    
                                    <span v-if="errors.password" class="text-danger float-left small">{{ errors.password }}</span>
                                </div>

                                <div class="form-group ">
                                    <button @click="Login()" type="button"  class="mt-4 btn btn-primary btn-lg btn-block full_rounded">
                                        <font-awesome-icon v-if="loading" icon="circle-notch" class="btn-icon" spin/>
                                        {{ $t("Sign in")}}
                                    </button>

                                    <transition name="fade">
                                            
                                        <b-alert v-show="errors.credentials" show class="mt-4" variant="danger">
                                            {{ $t(errors.credentials) }}
                                        </b-alert>

                                    </transition>
                                </div>

                                <!--
                                <div class="form-group d-flex justify-content-between">
                                    <router-link class="text-small" :to="{ name: 'password_reset' }" >{{ $t("Password reset")}}</router-link>
                                </div>
                                -->
                                
                                <!-- <p class="text-center">{{ $t("Or sign in with")}}</p>
                                <div class="form-group row d-flex justify-content-between">
                                    
                                    <div class="col-12">
                                        <a @click.prevent="googleLogin()" class="text-white btn btn-lg btn-block full_rounded btn-primary w-100">
                                            
                                            <template v-if="loadingGoogle">
                                                <font-awesome-icon icon="circle-notch" class="btn-icon" spin/>
                                            </template>
                                            
                                            <template v-else>
                                                <font-awesome-icon class="mr-2" :icon="['fab', 'google']" /> 
                                                <span class="text-white ">{{ $t("Google")}}</span>
                                            </template>
                                        </a>
                                        
                                    </div> -->

                                    <!--
                                    <div class="col-6">
                                        <a @click.prevent="googleLogin()" class="text-white btn btn-lg btn-block full_rounded btn-fb w-100">                                            
                                            <font-awesome-icon class="mr-2" :icon="['fab', 'facebook']" />                                            
                                            
                                            <span class="text-white ">{{ $t("Facebook")}}</span>
                                        </a>
                                        
                                    </div>
                                    -->

                                <!-- </div> -->
                                
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>

import firebase from 'firebase'

export default {
    data () {
        return {
						clients:[],
            showPassToggle:false,
            form: {
                email: '',
                password: ''
            },
            errors: {
                email: false,
                password: false,
                credentials: false
            },
            loading: false,
            loadingGoogle:false,
        }
    },
    watch: {
        'form.email': function (value) {
            let app = this
            app.errors.credentials = false

            if (!value) {
                app.errors.email = 'Email required.'
            } else if (!app.validEmail(value)) {
                app.errors.email = 'Valid email required.'
            } else {
                app.errors.email = false
            }
        },
        'form.password': function (value) {
            let app = this
            app.errors.credentials = false
            if (value) {
                app.errors.password = false
            } else {
                app.errors.password = 'Pasword required.'
            }
        }
		},
		created(){
			this.getClients()
		},    
    methods : {         
				getClients(){
					axios.get('http://solati.test.dev/api/v1/client').then(response=>{
						this.clients = response.data
						console.log(this.clients)
					})
				} ,     
        showPass(){
            this.showPassToggle = !this.showPassToggle
        },
        Login(){

            if (this.validform()) {

                this.loading = true                

                const payload = {
                    username: this.form.email,
                    password: this.form.password
								}
	
                
                this.$store.dispatch('AuthBasic',payload)
                .then((response) => {

                    this.loading = false
                    
                    let redirect = this.$route.query.redirect

                    if (redirect) {
                        this.$router.push(redirect)
                    } else {
                        this.$router.push({name: 'categories'})
                    }
                })
                .catch((error) => {

                    this.loading = false
                    
                    this.errors.credentials = 'Incorrect email or password'
                    
                    setTimeout(() => {
                        this.errors.credentials = false
                    },3000)
                    
                })
                
                
            }
        },
        validform() {
            let app = this

            if (!app.form.password) {
                app.errors.password = 'Pasword required.'
            }

            if (!app.form.email) {
                app.errors.email = 'Email required.'
            }

            if (!app.errors.email && !app.errors.password && app.validEmail(app.form.email)) {
                return true
            }

            return false
        },
        validEmail (email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email)
        },
        close_alert: function () {
            let app = this
            app.errors.credentials = false
        },
        
    }
}
</script>

<style scope>

.ml-3, .mx-3{
    margin-left: 0 !important;
}

.btn-fb {
    color: #fff;
    background-color: #3b5998 !important;
}
</style>
