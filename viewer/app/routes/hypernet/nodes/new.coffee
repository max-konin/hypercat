`import Ember from 'ember'`

NewRoute = Ember.Route.extend
  model: ()->
    geometry = @store.createRecord 'geometry/point'
    hypernet = @modelFor 'hypernet'
    @store.createRecord 'node', geometry: geometry, hypernet: hypernet

  renderTemplate: ->
    @render outlet: 'properties'

`export default NewRoute`
