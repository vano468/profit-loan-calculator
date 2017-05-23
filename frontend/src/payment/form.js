import { PaymentResource } from '../shared/resources';
import { makeObjectDuplicate } from '../shared/tools';

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
    },
    create() {
      this.resource.save(
        { payment: this.payment,
          borrower_id: this.model.borrower_id }
      ).then(
        (response) => {
          this.$emit('item:persisted', response.data);
        },
        (response) => {
          this.errors = response.data.errors;
        }
      );
    },
    update() {
      this.resource.update(
        { id: this.payment.id },
        { payment: this.payment }
      ).then(
        (response) => {
          this.errors = {};
          this.$emit('item:persisted', response.data);
        },
        (response) => {
          this.errors = response.data.errors;
        }
      );
    }
  }
};
