angular.module('backend').factory('Resume', ['$resource', '$http', ($resource, $http) ->
  class
    all: (callback, page = null) ->
      $resource('/resumes.json').query { page: page }, callback
])
