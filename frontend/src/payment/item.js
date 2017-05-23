import PaymentForm from './form';
import { PaymentResource } from '../shared/resources';
import { updateAttributes } from '../shared/tools';
import { EventBus } from '../shared/tools';

export default {
  template: '#x-template-payment',
  props: {
    item: Object
  },
  data() {
    return {
      editMode: false
    }
  },
  methods: {
    destroy() {
      if (confirm('Are you sure?')) {
        PaymentResource().delete({ id: this.item.id }).then(
          (_) => { this.$emit('item:destroyed'); }
        );
      }
    },
    onItemPersisted(data) {
      this.editMode = false;
      updateAttributes(this.item, data.payment);
      EventBus.$emit('payments:updated', this.item.borrower_id);
    }
  },
  components: {
    PaymentForm
  }
};
