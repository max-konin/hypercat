`import Ember from 'ember'`

NodeIndexRoute = Ember.Route.extend
  model: () ->
    @modelFor 'hypernet.nodes.node'

`export default NodeIndexRoute`
