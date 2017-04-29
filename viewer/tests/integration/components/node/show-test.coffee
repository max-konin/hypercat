`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'node/show', 'Integration | Component | node/show', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{node/show}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#node/show}}
      template block text
    {{/node/show}}
  """

  assert.equal @$().text().trim(), 'template block text'
