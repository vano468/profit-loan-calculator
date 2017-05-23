import { AnalyticsResource } from './shared/resources';
import { updateAttributes, EventBus } from './shared/tools';

export default {
  template: '#x-template-analytics',
  props: {
    analyzedData: {
      type: Object,
      default: () => gon.data.analytics
    }
  },
  data() {
    return {
      resource: AnalyticsResource()
    }
  },
  mounted() {
    EventBus.$on('borrowers:updated', _ => {
      this.updateInfo();
    });
  },
  methods: {
    updateInfo() {
      this.resource.get().then(
        (response) => {
          updateAttributes(this.analyzedData, response.data);
        }
      );
    }
  }
};
