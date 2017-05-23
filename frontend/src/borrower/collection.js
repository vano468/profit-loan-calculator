import Borrower from './item';
import BorrowerForm from './form';

export default {
  template: '#x-template-borrowers',
  props: {
    items: {
      type: Array,
      default: () => gon.data.borrowers
    }
  },
  methods: {
    onItemPersisted(data) {
      this.items.unshift(data.borrower)
    },
    onItemDestroyed(index) {
      this.items.splice(index, 1);
    }
  },
  components: {
    Borrower,
    BorrowerForm
  }
};
