angular.module 'frontend'
  .controller 'SpaceStationsController', ($scope,Restangular) ->
    base_space_stations = Restangular.all 'space_stations'
    $scope.title = 'SpaceStations'
    $scope.new_space_station =
      name: ''
      description: ''

    base_space_stations.getList().then (response) ->
      $scope.space_stations = response

    $scope.save = ->
      base_space_stations.post($scope.new_space_station).then (response) ->
        $scope.buttonDisabled = true
        $scope.space_stations.push response
        $scope.new_space_station.name = ''
        $scope.new_space_station.description = ''
        $scope.buttonDisabled = false

    $scope.remove = (space_station) ->
      space_station.remove().then ->
        _.remove $scope.space_stations, (p) -> p.id == space_station.id

    $scope.update = ->
      $scope.current_space_station.save().then (response) ->
        $scope.current_space_station = null

    $scope.setCurrent = (space_station) ->
      $scope.current_space_station = space_station

