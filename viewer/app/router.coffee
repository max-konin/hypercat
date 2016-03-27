`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'hypernets'
  @route 'hypernet', path: '/hypernets/:id', ->
    @route 'nodes', ->
      @route 'new'
      @route 'node', path: ':node_id', ->
        @route 'edit'

`export default Router`
