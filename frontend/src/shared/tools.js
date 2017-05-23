export const updateAttributes = (object, newObject) => {
  for (var key of Object.keys(newObject)) {
    object[key] = newObject[key];
  }
};

export const makeObjectDuplicate = (object, attributes, except = []) => {
  let newObject = {};
  for (let key of attributes) { newObject[key] = object[key]; }
  for (let key of except) { newObject[key] = undefined; }
  return newObject;
};

export const EventBus = new Vue(); // https://alligator.io/vuejs/global-event-bus
