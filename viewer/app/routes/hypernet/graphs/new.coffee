`import Ember from 'ember'`

NewRoute = Ember.Route.extend
  model: ()->
    hypernet = @modelFor 'hypernet'
    @store.createRecord 'graph', hypernet: hypernet

  renderTemplate: ->
    @render outlet: 'properties'

`export default NewRoute`
