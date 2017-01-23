`import Ember from 'ember'`

NodesRoute = Ember.Route.extend
  model: ->
    @hypernet = hypernet = @modelFor 'hypernet'
    @hypernet.get 'nodes'

  setupController: (controller, model) ->
    controller.set 'model', model
    controller.set 'hypernet', @hypernet

`export default NodesRoute`
