const formatNumber = {}
import numeral from 'numeral'

formatNumber.install = (Vue) => {
    Vue.filter('formatNumber', (value, format) => {
        return numeral(value).format(format)
    })
}

export default formatNumber