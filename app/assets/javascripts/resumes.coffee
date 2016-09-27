angular.module('app.resumes', ['ui.select', 'ngSanitize', 'ui.bootstrap', 'backend', 'frontend'])

angular.module('app.resumes')
.controller('ResumeCtrl', ['$scope', 'Skill', ($scope, Skill) ->
  $scope.initSelectedIds = (ids) ->
    $scope.selectedIds = ids

  $scope.addNewSkill = (name) ->
    new Skill().save name, (skill) ->
      $scope.skills.push(skill)
      $scope.selected.items.push(skill)

  $scope.skills = []
  $scope.selected = { items: [] }

  new Skill().all (skills) ->
    $scope.skills = skills
    $scope.selected.items = skills.filter (skill) ->
                              skill.id in $scope.selectedIds
])