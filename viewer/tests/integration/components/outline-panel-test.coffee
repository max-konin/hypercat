`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'outline-panel', 'Integration | Component | outline panel', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{outline-panel}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#outline-panel}}
      template block text
    {{/outline-panel}}
  """

  assert.equal @$().text().trim(), 'template block text'
