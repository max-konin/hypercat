`import Ember from 'ember'`

NodeFormComponent = Ember.Component.extend
  node: null

  geometryTypes: (-> ['Geometry::Base']).property()
  geometryType: 'geometry/point'

  classNames: ['ui', 'black', 'clearing', 'segment']

  actions:
    save: -> @sendAction()

`export default NodeFormComponent`
