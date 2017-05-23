import { PaymentResource } from '../shared/resources';
import { makeObjectDuplicate, updateAttributes } from '../shared/tools';

export default {
  template: '#x-template-payment_form',
  props: {
    model: {
      type: Object,
      default: () => ({})
    },
  },
  data() {
    return {
      payment: makeObjectDuplicate(this.model, ['id', 'month', 'amount']),
      resource: PaymentResource(),
      errors: {}
    }
  },
  methods: {
    persist(e) {
      e.preventDefault();
      this.payment.id ? this.update() : this.create();
    }
  }
};
