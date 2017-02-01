`import Ember from 'ember'`

HypernetGraphViewRoute = Ember.Route.extend
  model: -> @store.query 'edge', graph_id: @modelFor('hypernet.graph').get('id')

`export default HypernetGraphViewRoute`
