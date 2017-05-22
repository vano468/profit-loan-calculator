import { BorrowerResource } from '../shared/resources';
import { updateAttributes } from '../shared/tools';

export default () => {
  Vue.component('borrower', {
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
      destroy(e) {
        if (confirm('Are you sure?')) {

        }
      },
      onItemPersisted(data) {
        this.editMode = false;
        updateAttributes(this.item, data.borrower);
      }
    }
  });
};
