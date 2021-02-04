async function getAll(url = 'users'){
        return await axios.get(url)
}

export default  {    
        getAll
}