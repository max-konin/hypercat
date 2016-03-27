`import Ember from 'ember'`

HypernetsRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'hypernet', params.id

  renderTemplate: ->
    @render()
    @render 'hypernet/-menu', outlet: 'left-menu'

`export default HypernetsRoute`
