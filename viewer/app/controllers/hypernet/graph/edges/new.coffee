`import Ember from 'ember'`

HypernetGraphEdgesNewController = Ember.Controller.extend
  actions:
    save: ->
      @model.save().then (g) =>
        @transitionToRoute 'hypernet.graph'

`export default HypernetGraphEdgesNewController`
