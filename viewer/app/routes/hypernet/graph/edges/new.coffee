`import Ember from 'ember'`

EdgesNewRoute = Ember.Route.extend
  beforeModel: ->
    @graph = @modelFor 'hypernet.graph'
    @hypernet = @modelFor 'hypernet'
    @availableNodes = @store.query 'node', hypernet_id: @hypernet.id

  model: () ->
    @store.createRecord 'edge', graph: @graph

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'availableNodes', @availableNodes

`export default EdgesNewRoute`
