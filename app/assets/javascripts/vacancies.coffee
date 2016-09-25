angular.module('app.vacancies', ['ui.select', 'ngSanitize', 'ui.bootstrap', 'backend'])

angular.module('app.vacancies')
.controller('VacancyCtrl', ['$scope', 'Skill', ($scope, Skill) ->
  $scope.openExpiresDatepicker = ->
    $scope.expiresDatepickerOpened = true

  $scope.parseDate = (s) -> new Date(s)

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