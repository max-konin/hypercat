`import Ember from 'ember'`

HypernetGraphIndexRoute = Ember.Route.extend
  model: -> @modelFor 'hypernet.graph'

`export default HypernetGraphIndexRoute`
