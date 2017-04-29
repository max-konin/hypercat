`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:hypernet/graphs-mappings/graphs-mapping', 'Unit | Route | hypernet/graphs mappings/graphs mapping', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
