`import DS from 'ember-data'`

Hypernet = DS.Model.extend
  name: DS.attr('string')

  nodes: DS.hasMany 'nodes'

`export default Hypernet`
