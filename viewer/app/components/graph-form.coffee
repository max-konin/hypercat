`import Ember from 'ember'`

GraphFormComponent = Ember.Component.extend
  graph: null
  classNames: ['ui', 'black', 'clearing', 'segment']

  actions:
    save: -> @sendAction()

`export default GraphFormComponent`
