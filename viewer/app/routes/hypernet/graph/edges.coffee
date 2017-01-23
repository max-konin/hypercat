`import Ember from 'ember'`

EdgesRoute = Ember.Route.extend
  model: () ->
    @modelFor('hypernet.graph').get 'edges'

`export default EdgesRoute`
