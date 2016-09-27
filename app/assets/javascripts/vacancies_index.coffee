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
