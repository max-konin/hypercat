`import Ember from 'ember'`

HypernetGraphViewRoute = Ember.Route.extend
  model: -> @modelFor 'hypernet.graph'

`export default HypernetGraphViewRoute`
