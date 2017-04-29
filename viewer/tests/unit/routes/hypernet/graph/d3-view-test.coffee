`import { moduleFor, test } from 'ember-qunit'`

moduleFor 'route:hypernet/graph/d3-view', 'Unit | Route | hypernet/graph/d3 view', {
  # Specify the other units that are required for this test.
  # needs: ['controller:foo']
}

test 'it exists', (assert) ->
  route = @subject()
  assert.ok route
