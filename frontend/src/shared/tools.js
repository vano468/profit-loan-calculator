export const makeObjectDuplicate = (object, attributes, except = []) => {
  let newObject = {};
  for (let key of attributes) { newObject[key] = object[key]; }
  for (let key of except) { newObject[key] = undefined; }
  return newObject;
};
