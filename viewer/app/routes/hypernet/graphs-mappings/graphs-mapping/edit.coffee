`import Ember from 'ember'`

HypernetGraphsMappingsGraphsMappingEditRoute = Ember.Route.extend
  model:      -> @modelFor 'hypernet.graphs-mappings.graphs-mapping'
  afterModel: -> @graphs = @store.query 'graph', hypernet_id: @modelFor('hypernet').get('id')

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'graphs', @graphs

`export default HypernetGraphsMappingsGraphsMappingEditRoute`
