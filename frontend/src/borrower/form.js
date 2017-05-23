import { BorrowerResource } from '../shared/resources';
import { makeObjectDuplicate } from '../shared/tools';

export default {
  template: '#x-template-borrower_form',
  props: {
    model: {
      type: Object,
      default: () => ({})
    },
  },
  data() {
    return {
      borrower: makeObjectDuplicate(this.model,
        ['id', 'credit_amount', 'credit_term', 'base_rate', 'delay_rate']
      ),
      errors: {}
    }
  },
  methods: {
    persist(e) {
      e.preventDefault();
      this.borrower.id ? this.update() : this.create();
    },
    create() {

    },
    update() {

    }
  }
};
