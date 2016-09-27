angular.module('backend').factory('Resume', ['$resource', '$http', ($resource, $http) ->
  class
    all: (callback, page = null) ->
      $resource('/resumes.json').query { page: page }, callback

    fullyVacancies: (callback, resumeId, page = null) ->
      $resource("/resumes/#{resumeId}/fully_vacancies.json").query { page: page }, callback

    partlyVacancies: (callback, resumeId, page = null) ->
      $resource("/resumes/#{resumeId}/partly_vacancies.json").query { page: page }, callback
])
