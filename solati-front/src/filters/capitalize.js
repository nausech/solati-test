const capitalize = {}


capitalize.install = (Vue) => {
    Vue.filter('capitalize', (value) => {
        return value.toLowerCase()
        .split(' ')
        .map(word => word.charAt(0).toUpperCase() + word.slice(1))
        .join(' ')
    })
}

export default capitalize


