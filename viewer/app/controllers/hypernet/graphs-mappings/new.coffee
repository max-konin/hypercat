`import Ember from 'ember'`

HypernetGraphsMappingsNewController = Ember.Controller.extend
  hypernet: Ember.inject.controller()
  actions:
    save: ->
      @get('model').save().then (model) =>
          @transitionToRoute('hypernet.graphs-mappings.graphs-mapping', model.id)

`export default HypernetGraphsMappingsNewController`
