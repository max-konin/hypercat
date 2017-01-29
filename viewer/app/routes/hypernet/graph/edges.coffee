`import Ember from 'ember'`

EdgesRoute = Ember.Route.extend
  model: () -> @store.query 'edge', graph_id: @modelFor('hypernet.graph').get('id')

`export default EdgesRoute`
