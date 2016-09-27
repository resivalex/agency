angular.module('backend').factory('Vacancy', ['$resource', '$http', ($resource, $http) ->
  class
    all: (callback, page = null) ->
      $resource('/vacancies.json').query { page: page }, callback

    fullyResumes: (callback, vacancyId, page = null) ->
      $resource("/vacancies/#{vacancyId}/fully_resumes.json").query { page: page }, callback

    partlyResumes: (callback, vacancyId, page = null) ->
      $resource("/vacancies/#{vacancyId}/partly_resumes.json").query { page: page }, callback
])
