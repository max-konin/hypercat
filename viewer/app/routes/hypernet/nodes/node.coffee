`import Ember from 'ember'`

NodeRoute = Ember.Route.extend
  model: (params)->
    @store.find 'node', params.node_id

  renderTemplate: ->
    @render outlet: 'properties'

`export default NodeRoute`
