`import Ember from 'ember'`

HypernetGraphsMappingsGraphsMappingRoute = Ember.Route.extend
  model: (params) -> @store.find 'graphs-mapping', params.mapping_id

`export default HypernetGraphsMappingsGraphsMappingRoute`
