import Payment from './item';
import PaymentForm from './form';

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
      this.items.unshift(data.payment)
    },
    onItemDestroyed(index) {
      this.items.splice(index, 1);
    }
  },
  components: {
    Payment,
    PaymentForm
  }
};
