import { BorrowerResource } from '../shared/resources';
import { makeObjectDuplicate, updateAttributes } from '../shared/tools';

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
      resource: BorrowerResource(),
      errors: {}
    }
  },
  methods: {
    persist(e) {
      e.preventDefault();
      this.borrower.id ? this.update() : this.create();
    },
    create() {
      this.resource.save(
        { borrower: this.borrower }
      ).then(
        (response) => {
          this.errors = {};
          updateAttributes(this.borrower, {});
          this.$emit('item:persisted', response.data);
        },
        (response) => {
          this.errors = response.data.errors;
        }
      );
    },
    update() {
      this.resource.update(
        { id: this.borrower.id },
        { borrower: this.borrower }
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
