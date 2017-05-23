import Borrower from './item';
import BorrowerForm from './form';
import { EventBus } from '../shared/tools';

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
      this.items.unshift(data.borrower);
      EventBus.$emit('borrowers:updated');
    },
    onItemDestroyed(index) {
      this.items.splice(index, 1);
      EventBus.$emit('borrowers:updated');
    }
  },
  components: {
    Borrower,
    BorrowerForm
  }
};
