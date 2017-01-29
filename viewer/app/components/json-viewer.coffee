`import Ember from 'ember'`

JsonViewer = Ember.Component.extend
  tagName: 'pre'

  didRender: ->
    @$().html ''
    @$().jsonView @get('json')

`export default JsonViewer`
