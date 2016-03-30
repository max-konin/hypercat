`import DS from 'ember-data'`

Graph = DS.Model.extend
  name: DS.attr('string')

  hypernet: DS.belongsTo 'hypernet'
  edges:    DS.hasMany 'edge'

`export default Graph`
