`import Ember from 'ember'`

NodesRoute = Ember.Route.extend
  model: ->
    @hypernet = @modelFor 'hypernet'
    @store.query 'node', hypernet_id: @hypernet.get('id')

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'hypernet', @hypernet

`export default NodesRoute`
