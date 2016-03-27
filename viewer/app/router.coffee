`import Ember from 'ember';`
`import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'hypernets'
  @route 'hypernet', path: '/hypernets/:id', ->
    @route 'nodes', ->
      @route 'node', path: ':node_id'
`export default Router`
