`import DS from 'ember-data'`
`import { ActiveModelSerializer } from 'active-model-adapter'`

EdgeSerializer = ActiveModelSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    nodes: {
      serialize: 'ids',
      deserialize: 'ids'
    }

`export default EdgeSerializer`
