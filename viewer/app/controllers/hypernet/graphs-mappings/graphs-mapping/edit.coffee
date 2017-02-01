`import Ember from 'ember'`

HypernetGraphsMappingsGraphsMappingEditController = Ember.Controller.extend
  hypernet: Ember.inject.controller()
  actions:
    save: ->
      @get('model').save().then (model) =>
        @transitionToRoute('hypernet.graphs-mappings.graphs-mapping', @get('hypernet.model.id'), model.id)

`export default HypernetGraphsMappingsGraphsMappingEditController`
