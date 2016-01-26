@RequestParam = React.createClass
  getInitialState: ->
    console.log @props
    {
      key: @props.param.key
      value: @props.param.value
    }

  onKeyChange: (e) ->
    @setState(key: e.target.value)
    @notifyParent()

  onValueChange: (e) ->
    @setState(value: e.target.value)
    @notifyParent()

  notifyParent: ->
    @props.onChange @props.index, @state.key, @state.value if @props.onChange?

  render: ->
    `<div className="two fields">
      <div className="field">
        <label>Key:</label>
        <input type="text" value={this.state.key} onChange={this.onKeyChange}/>
      </div>
      <div className="field">
        <label>Value:</label>
        <input type="text" value={this.state.value} onChange={this.onValueChange}/>
      </div>

    </div>`
