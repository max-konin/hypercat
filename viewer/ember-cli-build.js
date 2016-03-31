/*jshint node:true*/
/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var app = new EmberApp(defaults, {
    fingerprint: {
      prepend: '/assets/ember/',
      extensions: ['js', 'css', 'png', 'gif', 'jpeg', 'jpg', 'svg', 'eot', 'ttf', 'woff']
    }
  });

  app.import('bower_components/fabric.js/dist/fabric.js');

  return app.toTree();
};
