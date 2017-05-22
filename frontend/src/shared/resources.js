export const BorrowerResource = () => {
  return Vue.resource('/api/borrowers{/id}');
};
