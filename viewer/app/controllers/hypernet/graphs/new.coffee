`import Ember from 'ember'`

HypernetGraphsNewController = Ember.Controller.extend
  actions:
    save: ->
      @model.save().then (g) =>
        @transitionToRoute 'hypernet.graphs'

`export default HypernetGraphsNewController`
