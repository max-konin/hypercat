`import { test, moduleForComponent } from 'ember-qunit'`
`import hbs from 'htmlbars-inline-precompile'`

moduleForComponent 'dock-workspace', 'Integration | Component | dock workspace', {
  integration: true
}

test 'it renders', (assert) ->
  assert.expect 2

  # Set any properties with @set 'myProperty', 'value'
  # Handle any actions with @on 'myAction', (val) ->

  @render hbs """{{dock-workspace}}"""

  assert.equal @$().text().trim(), ''

  # Template block usage:
  @render hbs """
    {{#dock-workspace}}
      template block text
    {{/dock-workspace}}
  """

  assert.equal @$().text().trim(), 'template block text'
