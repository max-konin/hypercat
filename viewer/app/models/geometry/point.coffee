`import Base from './base'`
`import DS from 'ember-data'`

GeometryPoint = Base.extend
  x: DS.attr 'number'
  y: DS.attr 'number'
  _type: DS.attr 'string', defaultValue: 'Geometry::Point'

`export default GeometryPoint`
