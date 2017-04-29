`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'graph-d3-force', 'Integration | Component | graph d3 force', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{graph-d3-force}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#graph-d3-force}}
      template block text
    {{/graph-d3-force}}
  """

  assert.equal @$().text().trim(), 'template block text'
