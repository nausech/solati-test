import moment from 'moment'
const fromNow = {}

//moment.locale('es')
moment.locale('es', {
  relativeTime: {
    future: 'in %s',
    past: 'hace %s',
    s:  'segundos',
    ss: '%ss',
    m:  'a minuto',
    mm: '%dm',
    h:  'an hora',
    hh: '%dh',
    d:  'a día',
    dd: '%dd',
    M:  'a mes',
    MM: '%dM',
    y:  'a año',
    yy: '%dY'
  }
});
fromNow.install = (Vue) => {
    Vue.filter('fromNow', (date) => {
        return moment(date).fromNow()        
    })
}

export default fromNow


