import VueResource from 'vue-resource';

import initBorrowerForm from 'borrower/form'

Vue.use(VueResource);

initBorrowerForm();

new Vue({
  el: '#profit-loan-calculator'
});
