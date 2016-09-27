angular.module('frontend').directive 'resumesTable',  ->
  restrict: 'E'
  templateUrl: '/angular/resumes_table'
  scope:
    page: '=page'
    pageSize: '=pageSize'
    total: '=total'
    resumes: '=resumes'
