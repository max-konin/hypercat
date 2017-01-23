`import Ember from 'ember'`

GraphRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'graph', params.graph_id

`export default GraphRoute`
