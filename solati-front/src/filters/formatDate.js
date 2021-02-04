import moment from 'moment-timezone'
const formatDate = {}
require('moment/locale/es')

formatDate.install = (Vue) => {
    Vue.filter('formatDate', (date,format) => {
        moment.locale('es')
        return moment(date).format(format)        
    })
}

export default formatDate


