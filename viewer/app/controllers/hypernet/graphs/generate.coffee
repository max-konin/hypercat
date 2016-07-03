`import Ember from 'ember'`

HypernetGraphsGenerateController = Ember.Controller.extend
  isGenerating: false
  n: 2
  m: 2
  name: 'grid'

  hypernetController: Ember.inject.controller 'hypernet'
  hypernet: Ember.computed.reads 'hypernetController.model'

  actions:
    generate: ->
      @set 'isGenerating', true

      data = {
        hypernet_id: @get('hypernet.id')
        generate: {
          n: @get('n')
          m: @get('m')
          name: @get('name')
          type: 'grid'
        }
      }

      Ember.$.ajax({
        url: "/api/v1/graphs"
        method: 'POST'
        data: data
      }).then((data)=>
        @store.pushPayload data
        @transitionToRoute 'hypernet.graphs'
      )#.finally => @set('isGenerating', false)
`export default HypernetGraphsGenerateController`
