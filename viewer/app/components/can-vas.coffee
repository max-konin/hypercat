`import Ember from 'ember'`

CanVas = Ember.Component.extend
  tagName: 'canvas'

  initFabricJs: (->
    canvas = new fabric.Canvas(@get('element.id'))

    rect = new fabric.Rect({
      left: 100,
      top: 100,
      fill: 'red',
      width: 20,
      height: 20
    })

    canvas.add(rect)

  ).on('didInsertElement')

`export default CanVas`
