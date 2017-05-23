import VueResource from 'vue-resource';

import Borrowers from 'borrower/collection';

Vue.use(VueResource);

new Vue({
  el: '#profit-loan-calculator',
  components: { Borrowers }
});
