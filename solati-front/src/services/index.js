//import http from '../plugins'

function Orders(url = 'orders'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),                
        getPending: (async(partner) => {
            return await axios.get(`${url}?search=1&columns=status_id&partner_id=${partner}`)
        }),
        getDelivered: (async(partner) => {
            return await axios.get(`${url}?search=4&columns=status_id`)
        }),
        getAccepted: (async() => {
            return await axios.get(`${url}?search=2&columns=status_id`)
        }),
        getDeclied: (async() => {
            return await axios.get(`${url}?search=3&columns=status_id`)
        })
    }
}

function PreOrders(url = 'pre-orders'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        })
    }
}

function Partners(url = 'partners'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
    }
}

function Openings(url = 'openings'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
    }
}

function RoutePlans(url = 'route-plans'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
    }
}

function RoutePlansToday(url = 'route-plans-today'){
    return {        
        getAll: (async () => {
            return await axios.get(`${url}`)
        })
    }
}

function VehicleRoutingOptimize(url = 'vehicle-routing-optimize'){
    return {        
        store: (async (toStore) => {
            return await axios.post(`${url}`,toStore)
        })
    }
}

function SpecialOpenings(url = 'special-openings'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
        create:(async (data)=>{
            return await axios.post(`${url}`, data)
        }),
        delete:(async (id)=>{
            return await axios.delete(`${url}/${id}`)
        })
    }
}

function PartnerStatuses(url = 'partners-statuses'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
    }
}

function ordersAcceptedPartner(url = 'partners-accepted-orders'){
    return {        
        getAll: (async (partner) => {
            return await axios.get(`${url}/${partner}`)
        })
    }
}

function MapService(url = 'google-directions'){
    return {        
        getAll: (async (latlng) => {
            return await axios.get(`${url}/${latlng}`)
        })
    }
}

function SpecialOpeningsPartner (url = 'partners-special-openings'){
    return {        
        getAll: (async (partner) => {
            return await axios.get(`${url}/${partner}`)
        })
    }
}

function ordersPendingPartner(url = 'partners-pending-orders'){
    return {        
        getAll: (async (partner) => {
            return await axios.get(`${url}/${partner}`)
        })
    }
}

function reasonsDeclineOrders(url = 'reasons-decline-orders') {
    return {
        getAll: (async () => {
            return await axios.get(url)
        }),
        update: (async(id,toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        })
    }
}

function Distributors(url = 'distributors'){
    return {
        getSearch: (async (text) => {
            return await axios.get(`${url}?search=${text}&columns=first_name,last_name,identification_number`)
        }),
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }), 
        store: (async (toStore) => {
            return await axios.post(`${url}`,toStore)
        }),       
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),                
    }
}

function Categories(url = 'categories'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),                
    }
}

function productsPartnerCategorie(url = 'partners-category-products'){
    return {        
        getAll: (async (partner, categorie) => {
            return await axios.get(`${url}/${partner}/${categorie}`)
        })
    }
}

function Aditionals(url = 'aditionals'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
        store: (async (toStore) => {
            return await axios.post(`${url}`,toStore)
        }),
        delete: (async (id) => {
            return await axios.delete(`${url}/${id}`)
        }),                  
    }
}




function VehicleAvailable(url = 'vehicle-available'){
    return {        
        getAll: (async (date) => {
            return await axios.get(`${url}/${date}`)
        })
    }
}

function Vehicles(url = 'vehicles'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
        store: (async (toStore) => {
            return await axios.post(`${url}`,toStore)
        }),
        delete: (async (id) => {
            return await axios.delete(`${url}/${id}`)
        }),                  
    }
}

function VehiclesTypes(url = 'vehicles-types'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
        store: (async (toStore) => {
            return await axios.post(`${url}`,toStore)
        }),
        delete: (async (id) => {
            return await axios.delete(`${url}/${id}`)
        }),                  
    }
}

function VehiclesColors(url = 'vehicles-colors'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
        store: (async (toStore) => {
            return await axios.post(`${url}`,toStore)
        }),
        delete: (async (id) => {
            return await axios.delete(`${url}/${id}`)
        }),                  
    }
}

function Products(url = 'products'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
        store: (async (toStore) => {
            return await axios.post(`${url}`,toStore)
        }),
        delete: (async (id) => {
            return await axios.delete(`${url}/${id}`)
        }),                  
    }
}

function Warehouses(url = 'warehouses'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
        store: (async (toStore) => {
            return await axios.post(`${url}`,toStore)
        }),
        delete: (async (id) => {
            return await axios.delete(`${url}/${id}`)
        }),                  
    }
}

function Providers(url = 'providers'){
    return {
        getOne: (async (id) => {
            return await axios.get(`${url}/${id}`)
        }),
        getAll: (async () => {
            return await axios.get(url)
        }),        
        update: (async (id, toUpdate) => {
            return await axios.put(`${url}/${id}`,toUpdate)
        }),
        store: (async (toStore) => {
            return await axios.post(`${url}`,toStore)
        }),
        delete: (async (id) => {
            return await axios.delete(`${url}/${id}`)
        }),                  
    }
}

export default  {    
    Partners,
    Openings,
    SpecialOpenings,
    PreOrders,
    Products,
    PartnerStatuses,
    SpecialOpeningsPartner,
    Orders,
    reasonsDeclineOrders,
    ordersAcceptedPartner,
    ordersPendingPartner,
    Categories,
    productsPartnerCategorie,
    Aditionals,
    Distributors,
    MapService,
    RoutePlans,
    Vehicles,
    VehiclesTypes,
    VehiclesColors,
    VehicleAvailable,
    RoutePlansToday,
    VehicleRoutingOptimize,
    Warehouses,
    Providers
}