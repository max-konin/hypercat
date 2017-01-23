`import DS from 'ember-data'`
`import { ActiveModelSerializer } from 'active-model-adapter'`

NodeSerializer = ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    geometry: {embedded: 'always'}

`export default NodeSerializer`
