`import Ember from 'ember'`

EdgeFormComponent = Ember.Component.extend
  edge: null
  nodes: []
  classNames: ['ui', 'black', 'clearing', 'segment']

  actions:
    save: -> @sendAction()

`export default EdgeFormComponent`
