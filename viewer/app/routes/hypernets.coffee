`import Ember from 'ember'`

HypernetsRoute = Ember.Route.extend
  model: ->
    @store.findAll 'hypernet'

`export default HypernetsRoute`
