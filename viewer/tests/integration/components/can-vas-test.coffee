`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'can-vas', 'Integration | Component | can vas', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{can-vas}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#can-vas}}
      template block text
    {{/can-vas}}
  """

  assert.equal @$().text().trim(), 'template block text'
