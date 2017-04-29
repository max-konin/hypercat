`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:hypernet/graphs-mappings/graphs-mapping/edit', 'Unit | Route | hypernet/graphs mappings/graphs mapping/edit', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
