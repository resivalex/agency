angular.module('backend').factory('Skill', ['$resource', '$http', ($resource, $http) ->
  class
    constructor: ->
      $http.defaults.headers.patch ||= {}
      $http.defaults.headers.patch['Content-Type'] = 'application/json'

    all: (callback) ->
      $resource('/skills.json').query callback

    save: (name, callback) ->
      $resource('/skills/:id.json').save { name: name }, callback
])
