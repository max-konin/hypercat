`import DS from 'ember-data'`

Node = DS.Model.extend
  name: DS.attr('string')

  hypernet: DS.belongsTo 'hypernet'

`export default Node`
