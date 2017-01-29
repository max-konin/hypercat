/*jshint node:true*/
/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var app = new EmberApp(defaults, {
    fingerprint: {
      prepend: '/assets/ember/'
    }
  });

  app.import('bower_components/fabric.js/dist/fabric.js');
  app.import('bower_components/vivagraphjs/dist/vivagraph.js');
  app.import('bower_components/jquery.json-view/dist/jquery.json-view.min.js');
  app.import('bower_components/jquery.json-view/dist/jquery.json-view.min.css');

  return app.toTree();
};
