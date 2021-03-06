`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'sandbox'

  @route 'hypernets'
  @route 'hypernet', path: '/hypernets/:id', ->
    @route 'graphs', ->
      @route 'new'
      @route 'generate'
    @route 'graph', path: 'graphs/:graph_id', ->
      @route 'view'
      @route 'edges', ->
        @route 'new'
    @route 'graphs-mappings', ->
      @route 'new'
      @route 'graphs-mapping', path: ':mapping_id', ->
        @route 'edit'
    @route 'nodes', ->
      @route 'new'
      @route 'node', path: ':node_id', ->
        @route 'edit'

  @route 'test_graph'

`export default Router`
