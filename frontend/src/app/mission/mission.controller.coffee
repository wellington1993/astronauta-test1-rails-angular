angular.module 'frontend'
  .controller 'MissionController', ($scope,Restangular) ->
    base_mission = Restangular.one 'missions', $routeParams
    $scope.title = 'Mission'

    base_mission.get().then (response) ->
      $scope.mission = response

