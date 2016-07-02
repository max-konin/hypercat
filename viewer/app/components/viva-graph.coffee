`import Ember from 'ember'`

VivaGraphComponent = Ember.Component.extend
  classNames: ['viva-graph']
  graph: null

  didInsertElement: ->
    graph = Viva.Graph.graph()

    @get('graph.edges').forEach (e) ->
      if e.get('source.id')? && e.get('target.id')?
        graph.addLink e.get('source.id'), e.get('target.id')

    renderer = Viva.Graph.View.renderer(graph, {
      container: @get('element')
    })
    renderer.run()

`export default VivaGraphComponent`
