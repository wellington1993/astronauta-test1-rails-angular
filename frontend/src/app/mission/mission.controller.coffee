angular.module 'frontend'
  .controller 'MissionController', ($scope,Restangular, $stateParams) ->
    base_mission = Restangular.one 'missions', $stateParams.id
    base_astronauts = Restangular.all 'availables'
    $scope.title = 'Mission'

    base_mission.get().then (mission_response) ->
      $scope.mission = mission_response

    base_astronauts.getList().then (response) ->
      $scope.astronauts = response

    $scope.addAstronaut = (astronaut) ->
      astronaut_base = Restangular.one 'astronauts', astronaut.id

      astronaut_base.get().then (base_response) ->
        astronaut_to_edit = base_response
        astronaut_to_edit.mission_id = $scope.mission.id

        astronaut_to_edit.save().then (edit_response) ->
          _.remove $scope.astronauts, (a) -> a.id == astronaut_to_edit.id
          $scope.mission.astronauts.push(astronaut_to_edit)

    $scope.removeAstronaut = (astronaut) ->
      astronaut_base = Restangular.one 'astronauts', astronaut.id

      astronaut_base.get().then (base_response) ->
        astronaut_to_edit = base_response
        astronaut_to_edit.mission_id = null

        astronaut_to_edit.save().then (edit_response) ->
          _.remove $scope.mission.astronauts, (a) -> a.id == astronaut_to_edit.id
          $scope.astronauts.push(astronaut_to_edit)



