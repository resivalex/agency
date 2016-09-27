angular.module('app.resumes_index', ['backend', 'frontend'])

angular.module('app.resumes_index')
.controller('ResumesCtrl', ['$scope', 'Resume', ($scope, Resume) ->
    new Resume().all (resumes) ->
      $scope.resumes = resumes
      console.log 'resumes', resumes

    $scope.$watch 'page', (page) ->
      new Resume().all (resumes) ->
        $scope.resumes = resumes
      , page
])
