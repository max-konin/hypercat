`import DS from 'ember-data'`

Edge = DS.Model.extend
  name: DS.attr('string')

  graph:  DS.belongsTo 'graph'
  source: DS.belongsTo 'node'
  target: DS.belongsTo 'node'

`export default Edge`
