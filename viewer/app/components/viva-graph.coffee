`import Ember from 'ember'`

VivaGraphComponent = Ember.Component.extend
  classNames: ['viva-graph']
  edges: []

  didInsertElement: ->
    graph = Viva.Graph.graph()

    @get('edges').forEach (e) ->
      graph.addLink e.get('nodeIds')[0], e.get('nodeIds')[1] if e.get('nodeIds')[0]? && e.get('nodeIds')[1]?

    renderer = Viva.Graph.View.renderer(graph, {
      container: @get('element')
    })
    renderer.run()

`export default VivaGraphComponent`
