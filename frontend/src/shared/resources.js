export const BorrowerResource = () => {
  return Vue.resource('/api/borrowers{/id}');
};

export const PaymentResource = () => {
  return Vue.resource('/api/payments{/id}');
};

export const AnalyticsResource = () => {
  return Vue.resource('/api/analytics{/id}');
};
