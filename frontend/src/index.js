import VueResource from 'vue-resource';

import initBorrowerCollection from 'borrower/collection';
import initBorrowerItem from 'borrower/item';
import initBorrowerForm from 'borrower/form';

Vue.use(VueResource);

initBorrowerCollection(); initBorrowerItem(); initBorrowerForm();

new Vue({
  el: '#profit-loan-calculator'
});
