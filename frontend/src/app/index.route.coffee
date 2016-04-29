angular.module 'frontend'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'

      .state 'missions',
        url: '/missions'
        templateUrl: 'app/missions/missions.html'
        controller: 'MissionsController'
        controllerAs: 'missions'

      .state 'astronauts',
        url: '/astronauts'
        templateUrl: 'app/astronauts/astronauts.html'
        controller: 'AstronautsController'
        controllerAs: 'astronauts'

      .state 'space_stations',
        url: '/space_stations'
        templateUrl: 'app/space_stations/space_stations.html'
        controller: 'SpaceStationsController'
        controllerAs: 'space_stations'

    $urlRouterProvider.otherwise '/'

