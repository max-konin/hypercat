`import DS from 'ember-data'`

Node = DS.Model.extend
  name: DS.attr('string')

  hypernet: DS.belongsTo 'hypernet'
  geometry: DS.belongsTo 'geometry/base', polymorphic: true

`export default Node`
