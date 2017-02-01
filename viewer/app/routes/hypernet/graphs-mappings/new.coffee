`import Ember from 'ember'`

HypernetGraphsMappingsNewRoute = Ember.Route.extend
  model:      -> @store.createRecord 'graphs-mapping', hypernet: @modelFor('hypernet')
  afterModel: -> @graphs = @store.query 'graph', hypernet_id: @modelFor('hypernet').get('id')

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'graphs', @graphs

`export default HypernetGraphsMappingsNewRoute`
