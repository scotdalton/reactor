var coffeeReact = require('coffee-react');
module.exports = {
  process: function(src, path) {
    // CoffeeScript files can be .coffee, .litcoffee, or .coffee.md
    if (coffeeReact.helpers.isCoffee(path)) {
      return coffeeReact.compile(src, {'bare': true});
    }
    return src;
  }
};
