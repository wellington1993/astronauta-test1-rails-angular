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

    $urlRouterProvider.otherwise '/'

