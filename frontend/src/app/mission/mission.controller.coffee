angular.module 'frontend'
  .controller 'MissionController', ($scope,Restangular, $stateParams) ->
    base_mission = Restangular.one 'missions', $stateParams.id
    base_astronauts = Restangular.all 'availables'
    $scope.title = 'Mission'

    base_mission.get().then (mission_response) ->
      $scope.mission = mission_response

    base_astronauts.getList().then (response) ->
      $scope.astronauts =  response

    $scope.addAstronaut = (astronaut) ->
      astronaut_base = Restangular.one 'astronauts', astronaut.id

      astronaut_base.get().then (response) ->
        astronaut_to_edit = response
        astronaut_to_edit.mission_id = $scope.mission.id

        astronaut_to_edit.save().then ((response) ->
          $scope.astronauts.splice(astronaut.index,1)
          $scope.mission.astronauts.push(astronaut)
        ), (response) ->
          console.log("Nao deu certo cara!")
          console.log(response) 


