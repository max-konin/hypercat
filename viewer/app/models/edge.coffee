`import DS from 'ember-data'`

Edge = DS.Model.extend
  name:    DS.attr 'string'
  nodeIds: DS.attr()
  graph: DS.belongsTo 'graph'
  nodes: DS.hasMany 'node'


`export default Edge`
