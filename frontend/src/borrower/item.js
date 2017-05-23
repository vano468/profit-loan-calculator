import BorrowerForm from 'borrower/form';
import { BorrowerResource } from '../shared/resources';
import { updateAttributes } from '../shared/tools';

export default {
  template: '#x-template-borrower',
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
        BorrowerResource().delete({ id: this.item.id }).then(
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
    BorrowerForm
  }
};
