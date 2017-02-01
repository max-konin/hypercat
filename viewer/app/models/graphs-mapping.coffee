`import DS from 'ember-data'`

GraphsMapping = DS.Model.extend
  source: DS.belongsTo 'graph'
  target: DS.belongsTo 'graph'
  hypernet: DS.belongsTo 'hypernet'

  name: Ember.computed 'source.name', 'target.name', 'source.isFulfilled', 'source.isFulfilled', ->
    if @get('source.isFulfilled') && @get('source.isFulfilled')
      @get('source.name') + @get('target.name')

`export default GraphsMapping`
