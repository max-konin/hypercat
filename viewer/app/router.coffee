`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'hypernets'
  @route 'hypernet', path: '/hypernets/:id', ->
    @route 'graphs', ->
      @route 'new'
    @route 'graph', path: 'graphs/:graph_id', ->
      @route 'view'
      @route 'edges', ->
        @route 'new'
        @route 'edge', ->
          @route 'edit'

    @route 'nodes', ->
      @route 'new'
      @route 'node', path: ':node_id', ->
        @route 'edit'
  @route 'test_graph'

`export default Router`
