`import Ember from 'ember'`

SandboxController = Ember.Controller.extend
  ajax: Ember.inject.service()

  verbs: ['GET', 'POST', 'PUT', 'DELETE']
  verb: 'GET'
  url: '/api/v1/'
  dataIsValid: true

  isSuccess: Ember.computed.lt 'response.statusCode', 400
  status:    Ember.computed 'response', -> "#{@get 'response.statusCode'} #{@get 'response.statusText'}"

  dataObserver: Ember.observer 'data', -> @set 'dataIsValid', true

  actions:
    sendRequest: ->
      try
        if Ember.isBlank @get('data')
          data = null
        else
          data = JSON.parse(@get('data'))
      catch
        @set 'dataIsValid', false
        return

      responseHandler = (result) =>
        response = Ember.Object.create {
          statusCode: result.jqXHR.status
          statusText: result.jqXHR.statusText
          data:       result.response
        }
        @set 'response', response

      @get('ajax').raw(@get('url'),
        method: @get('verb')
        data: data
      ).then(responseHandler).catch(responseHandler)



`export default SandboxController`
