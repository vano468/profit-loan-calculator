import Payment from './item';
import PaymentForm from './form';
import { EventBus } from '../shared/tools';

export default {
  template: '#x-template-payments',
  props: {
    items: Array,
    borrower_id: Number
  },
  data() {
    return {
      addMode: false,
    }
  },
  methods: {
    onItemPersisted(data) {
      this.addMode = false;
      this.items.push(data.payment);
      EventBus.$emit('payments:updated', this.borrower_id);
    },
    onItemDestroyed(index) {
      this.items.splice(index, 1);
      EventBus.$emit('payments:updated', this.borrower_id);
    }
  },
  components: {
    Payment,
    PaymentForm
  }
};
