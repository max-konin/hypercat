`import Ember from 'ember'`

VivaGraphComponent = Ember.Component.extend
  classNames: ['viva-graph']
  edges: []

  didInsertElement: ->
    graph = Viva.Graph.graph()

    @get('edges').forEach (e) ->
      graph.addLink e.get('source.id'), e.get('target.id') if e.get('source.id')? && e.get('target.id')?

    renderer = Viva.Graph.View.renderer(graph, {
      container: @get('element')
    })
    renderer.run()

`export default VivaGraphComponent`
