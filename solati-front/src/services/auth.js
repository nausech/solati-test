
function Auth(url = 'auth'){
    
    return {
        
        Basic: (async (username,password) => {
            
            return await axios.post(`${url}/sign-in`, {},{
                auth: {
                    username: username,
                    password: password
                }
            })
        }),        
        googleIdToken: (async (idToken) => {
            
            const payload = {
                id_token: idToken
            }

            return await axios.post(`${url}/google-id-token`, payload)
        })
    }
}

export default  {    
    Auth
}