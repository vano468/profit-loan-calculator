import VueResource from 'vue-resource';

import Borrowers from './borrower/collection';
import Analytics from './analytics';

Vue.use(VueResource);

new Vue({
  el: '#profit-loan-calculator',
  components: {
    Borrowers,
    Analytics
  }
});
