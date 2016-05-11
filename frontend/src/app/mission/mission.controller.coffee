angular.module 'frontend'
  .controller 'MissionController', ($scope,Restangular, $stateParams) ->
    base_mission = Restangular.one 'missions', $stateParams.id
    base_astronauts = Restangular.all 'astronauts'
    $scope.title = 'Mission'

    base_mission.get().then (mission_response) ->
      $scope.mission = mission_response

    base_astronauts.getList().then (response) ->
      mission_astronauts_ids = _.map($scope.mission.astronauts,"id")
      $scope.astronauts =  _.filter response = (astronaut) -> mission_astronauts.indexOf(astronaut.id) >= 0

