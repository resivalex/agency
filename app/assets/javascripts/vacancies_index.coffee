angular.module('app.vacancies_index', ['backend', 'frontend'])

angular.module('app.vacancies_index')
.controller('VacanciesCtrl', ['$scope', 'Vacancy', ($scope, Vacancy) ->
    new Vacancy().all (vacancies) ->
      $scope.vacancies = vacancies

    $scope.$watch 'page', (page) ->
      new Vacancy().all (vacancies) ->
        $scope.vacancies = vacancies
      , page
])
.controller('VacancyFullyResumesCtrl', ['$scope', 'Vacancy', ($scope, Vacancy) ->
    $scope.$watch 'vacancyId', (vacancyId) ->
      new Vacancy().fullyResumes (resumes) ->
        $scope.resumes = resumes

      , $scope.vacancyId

    $scope.$watch 'page', (page) ->
      new Vacancy().fullyResumes (resumes) ->
        $scope.resumes = resumes

      , $scope.vacancyId, page
])
.controller('VacancyPartlyResumesCtrl', ['$scope', 'Vacancy', ($scope, Vacancy) ->
    $scope.$watch 'vacancyId', (vacancyId) ->
      new Vacancy().partlyResumes (resumes) ->
        $scope.resumes = resumes

      , $scope.vacancyId

    $scope.$watch 'page', (page) ->
      new Vacancy().partlyResumes (resumes) ->
        $scope.resumes = resumes

      , $scope.vacancyId, page
])
