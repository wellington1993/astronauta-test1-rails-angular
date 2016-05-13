angular.module 'frontend'
  .controller 'AstronautsController', ($scope,Restangular) ->
    base_astronauts = Restangular.all 'astronauts'
    $scope.title = 'Astronauts'
    $scope.new_astronaut =
      name: ''

    base_astronauts.getList().then (response) ->
      $scope.astronauts = response

    $scope.save = ->
      base_astronauts.post($scope.new_astronaut).then ((response) ->
        $scope.buttonDisabled = true
        $scope.astronauts.push response
        $scope.new_astronaut.name = ''
        $scope.buttonDisabled = false
        $score.errors.length = 0
      ),(response) ->
        $scope.errors = response.data

    $scope.remove = (astronaut) ->
      astronaut.remove().then ->
        _.remove $scope.astronauts, (p) -> p.id == astronaut.id

    $scope.update = ->
      $scope.current_astronaut.save().then (response) ->
        $scope.current_astronaut = null

    $scope.setCurrent = (astronaut) ->
      $scope.current_astronaut = astronaut

