import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({	
	mode: 'history',
	routes: [
		{
			path: '/',
			meta: { requiresAuth: true },
			component: () => import('@/layouts/app/_layout.vue'),
			redirect: {name:'categories'},			
			children: [								
				
				{
					path: '/app/categories',
					name: 'clients',
					meta: {title: 'clients'},
					component: () => import('@/pages/app/clients'),
				},
						
				
			]
		},		
		{
			path: '/auth',
			name: 'auth',			
			component: () => import('@/layouts/auth/_layout.vue'),
			children: [
				{
					path: '/auth/sign_in',
					name: 'auth/sign_in',
					meta: {title: 'Sign In'},
					component: () => import('@/pages/auth/Login.vue'),
					
				},				
				{
					path: '/auth/password_reset',
					name:'password_reset',
					meta: {title: 'Password_Reset'},
					component: () => import('@/pages/auth/PasswordReset.vue'),
				},
				{
					path: '/app/clients',
					name: 'clients',
					meta: {title: 'clients'},
					component: () => import('@/pages/app/clients'),
				},
			]
		}
  ]
})

