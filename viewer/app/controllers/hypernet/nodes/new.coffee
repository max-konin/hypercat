`import Ember from 'ember'`

HypernetNodesNewController = Ember.Controller.extend
  actions:
    save: ->
      @model.save().then (node) =>
        @transitionToRoute 'hypernet.nodes.node', node.id

`export default HypernetNodesNewController`
