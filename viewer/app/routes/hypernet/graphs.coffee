`import Ember from 'ember'`

GraphsRoute = Ember.Route.extend
  model: ->
    @hypernet = hypernet = @modelFor 'hypernet'
    @store.query 'graph', hypernet_id: @hypernet.id

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'hypernet', @hypernet

`export default GraphsRoute`
