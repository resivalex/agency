angular.module('backend').factory('Vacancy', ['$resource', '$http', ($resource, $http) ->
  class
    all: (callback, page = null) ->
      $resource('/vacancies.json').query { page: page }, callback
])
