angular.module('app.resumes_index', ['backend', 'frontend'])

angular.module('app.resumes_index')
.controller('ResumesCtrl', ['$scope', 'Resume', ($scope, Resume) ->
    new Resume().all (resumes) ->
      $scope.resumes = resumes

    $scope.$watch 'page', (page) ->
      new Resume().all (resumes) ->
        $scope.resumes = resumes
      , page
])
.controller('ResumeFullyVacanciesCtrl', ['$scope', 'Resume', ($scope, Resume) ->
    $scope.$watch 'resumeId', (resumeId) ->
      new Resume().fullyVacancies (vacancies) ->
        $scope.vacancies = vacancies

      , $scope.resumeId

    $scope.$watch 'page', (page) ->
      new Resume().fullyVacancies (vacancies) ->
        $scope.vacancies = vacancies

      , $scope.resumeId, page
])
.controller('ResumePartlyVacanciesCtrl', ['$scope', 'Resume', ($scope, Resume) ->
    $scope.$watch 'resumeId', (resumeId) ->
      new Resume().partlyVacancies (vacancies) ->
        $scope.vacancies = vacancies

      , $scope.resumeId

    $scope.$watch 'page', (page) ->
      new Resume().partlyVacancies (vacancies) ->
        $scope.vacancies = vacancies

      , $scope.resumeId, page
])
