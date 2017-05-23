import BorrowerForm from './form';
import Payments from '../payment/collection';
import { BorrowerResource } from '../shared/resources';
import { updateAttributes, EventBus } from '../shared/tools';

export default {
  template: '#x-template-borrower',
  props: {
    item: Object
  },
  data() {
    return {
      editMode: false,
      resource: BorrowerResource()
    }
  },
  mounted() {
    EventBus.$on('payments:updated', borrowerId => {
      if (borrowerId === this.item.id) { this.updateItem(); }
    });
  },
  methods: {
    updateItem() {
      this.resource.get(
        { id: this.item.id }
      ).then(
        (response) => {
          this.onItemPersisted(response.data);
        }
      );
    },
    destroy() {
      if (confirm('Are you sure?')) {
        this.resource.delete({ id: this.item.id }).then(
          (_) => { this.$emit('item:destroyed'); }
        );
      }
    },
    onItemPersisted(data) {
      this.editMode = false;
      updateAttributes(this.item, data.borrower);
    }
  },
  components: {
    BorrowerForm,
    Payments
  }
};
