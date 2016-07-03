`import Ember from 'ember'`

GenerateRoute = Ember.Route.extend
  renderTemplate: ->
    @render outlet: 'properties'

`export default GenerateRoute`
