angular.module('frontend').directive 'vacanciesTable',  ->
  restrict: 'E'
  templateUrl: '/angular/vacancies_table'
  scope:
    page: '=page'
    pageSize: '=pageSize'
    total: '=total'
    vacancies: '=vacancies'
