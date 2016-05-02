angular.module 'frontend'
  .controller 'MissionsController', ($scope,Restangular) ->
    base_missions = Restangular.all 'missions'
    $scope.title = 'Missions'
    $scope.new_mission =
      name: ''
      astronauts: []

    base_missions.getList().then (response) ->
      $scope.missions = response

    $scope.save = ->
      base_missions.post($scope.new_mission).then (response) ->
        $scope.buttonDisabled = true
        $scope.missions.push response
        $scope.new_mission.name = ''
        $scope.buttonDisabled = false

    $scope.remove = (mission) ->
      mission.remove().then ->
        _.remove $scope.missions, (p) -> p.id == mission.id


    $scope.update = ->
      $scope.current_mission.save().then (response) ->
        $scope.current_mission = null

    $scope.setCurrent = (mission) ->
      $scope.current_mission = mission

