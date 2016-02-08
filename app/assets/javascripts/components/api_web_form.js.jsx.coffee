@ApiWebForm = React.createClass
  mixins: [React.addons.LinkedStateMixin]

  getInitialState: ->
    {
      url: '/api/v1/'
      method: 'GET'
      params: []
      paramsCount: 0
      response: ''
    }

  addParams: ->
#    console.log 'add params'
    params = Array.apply(undefined, @state.params)
    params.push {key: '', value: ''}
    @setState params: params

  paramsDidUpdate: (index, key, value) ->
    @state.params[index].key = key
    @state.params[index].value = value

  syntaxHighlight: (json) ->
    if typeof json != 'string'
      json = JSON.stringify(json, undefined, 2)
    json = json.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;')
    json.replace /("(\\u[a-zA-Z0-9]{4}|\\[^u]|[^\\"])*"(\s*:)?|\b(true|false|null)\b|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?)/g, (match) ->
      cls = 'number'
      if /^"/.test(match)
        if /:$/.test(match)
          cls = 'key'
        else
          cls = 'string'
      else if /true|false/.test(match)
        cls = 'boolean'
      else if /null/.test(match)
        cls = 'null'
      '<span class="' + cls + '">' + match + '</span>'

  sendRequest: ->
    data = {}
    @state.params.forEach (p) ->
      data[p.key] = p.value if p.key? &&p.key != ''

    $.ajax({
      url: @state.url
      data: data
      method: @state.method
    }).then ( (response) =>
      @setState response: JSON.stringify(response, undefined, 2)
    ), =>  @setState(response: 'Error')

  render: ->
    paramsNodes = @state.params.map (p) =>
      index = @state.params.indexOf(p)
      onChangeAction = this.paramsDidUpdate
      `<RequestParam key={index} param={p} index={index} onChange={onChangeAction}></RequestParam>`

    `<div>
      <div>Response: </div>
      <pre>{this.state.response}</pre>
      <div className="ui form">
        <div className="field">
          <label>Method:</label>
          <select type="text" valueLink={this.linkState('method')}>
            <option>GET</option>
            <option>POST</option>
            <option>PUT</option>
            <option>PATCH</option>
            <option>DELETE</option>
          </select>
        </div>

        <div className="field">
          <label>Url:</label>
          <input type="text" valueLink={this.linkState('url')}/>
        </div>

        <div>
          <div className="field">
            <label>Parameters</label>
            {paramsNodes}
            <button className="ui icon button" onClick={this.addParams}>+</button>
          </div>
        </div>
        <button className="ui primary button" onClick={this.sendRequest}>send</button>
      </div>
    </div>`
