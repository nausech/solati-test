const storeleftMenuItems = {
    namespaced: true,
    state: {
        menuDefault:'categories',
        menuItems:[],
        menus:[
            {
                name:'categories',
                items:[            
                    {
                        id:1,
                        routeName:'categories',
                        text:'Categorías',
                        action:null,
                        roles:['all'],                    
                        iconClass:'nav-bar-icon mr-2 mdi-28px mdi mdi-archive'
                    },
                    {
                        id:2,
                        routeName:'drivers',
                        text:'Proyectos',
                        action:null,
                        roles:['all'],                    
                        iconClass:'nav-bar-icon mr-2 mdi-28px mdi mdi-monitor-dashboard'
                    },
                    {
                        id:3,
                        routeName:'users',
                        text:'Clientes',
                        action:null,
                        roles:['all'],                    
                        iconClass:'nav-bar-icon mr-2 mdi mdi-28px  mdi-account-group-outline',
                    },
                    {
                        id:3,
                        routeName:'users',
                        text:'Configuracón',
                        action:null,
                        roles:['all'],                    
                        iconClass:'nav-bar-icon mr-2 mdi mdi-28px mdi-settings-outline',
                    },
                    {
                        id:4,
                        routeName:'users',
                        text:'Profile',
                        action:null,
                        roles:['all'],                    
                        iconClass:'nav-bar-icon mr-2 mdi mdi-28px mdi-account-outline'
                    }    
                ]
            }
        ]
        
    },    
    actions: {        
        setMenuItems({commit},data){
            commit('SET_MENU_ITEMS',data)
        }
    },
    mutations: {
        
        SET_MENU_ITEMS(state,data){        
            const menus = state.menus.filter((menu) => {
                return (data == menu.name)
            }).map((menu) => menu.items)[0]
            
            state.menuItems = menus
        }
    }
}

export default storeleftMenuItems