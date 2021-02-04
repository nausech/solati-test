const storeModals = {
    namespaced: true,
    state: {
        modalToggleVehicleShow:false,
        modalToggleStore:[],
    },    
    actions: {
        setModalToggleVehicleShow({commit},data){
            commit('SET_OPEN_MODAL_CREATE',data)
        },    
        showModalToggle({commit},data){
            commit('SHOW_OPEN_MODAL_TOGGLE',data)
        },    
        resetModalToggle({commit}){
            commit('RESET_OPEN_MODALS_TOGGLE')
        }
    },
    mutations: {
        
        SHOW_OPEN_MODAL_TOGGLE(state,data){        

            const find = state.modalToggleStore.filter((modal) => {
                return (modal.name == data)
            })
            
            if (find.length == 0 ){
                state.modalToggleStore.push({name:data})
            }
            else{
                state.modalToggleStore = state.modalToggleStore.filter((modal) => {
                    return (modal.name != data)
                }) 
            }
        },
        RESET_OPEN_MODALS_TOGGLE(state){
            state.modalToggleStore = []
        },
        SET_OPEN_MODAL_CREATE(state){        
            state.modalToggleVehicleShow = !state.modalToggleVehicleShow
        },
    }
}

export default storeModals