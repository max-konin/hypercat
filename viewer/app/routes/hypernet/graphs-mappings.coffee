`import Ember from 'ember'`

HypernetGraphsMappingsRoute = Ember.Route.extend
  model: -> @store.query 'graphs-mapping', hypernet_id: @modelFor('hypernet').get('id')

`export default HypernetGraphsMappingsRoute`
