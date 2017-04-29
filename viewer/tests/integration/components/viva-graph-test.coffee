`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'viva-graph', 'Integration | Component | viva graph', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{viva-graph}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#viva-graph}}
      template block text
    {{/viva-graph}}
  """

  assert.equal @$().text().trim(), 'template block text'
