angular.module 'frontend'
  .controller 'MainController', ($timeout, webDevTec, toastr) ->
    'ngInject'
    vm = this
    activate = ->
      getWebDevTec()
      $timeout (->
        vm.classAnimation = 'rubberBand'
        return
      ), 4000
      return

    showToastr = ->
      toastr.info 'Fork <a href="https://github.com/Swiip/generator-gulp-angular" target="_blank"><b>generator-gulp-angular</b></a>'
      vm.classAnimation = ''
      return

    getWebDevTec = ->
      vm.awesomeThings = webDevTec.getTec()
      angular.forEach vm.awesomeThings, (awesomeThing) ->
        awesomeThing.rank = Math.random()
        return
      return

    RestangularProvider.setDefaultHeaders
      'If-Modified-Since': 'Mon, 26 Jul 1997 05:00:00 GMT'
      'Cache-Control': 'no-cache'
      'Pragma': 'no-cache'


    vm.awesomeThings = []
    vm.classAnimation = ''
    vm.creationDate = 1461780094225
    vm.showToastr = showToastr
    activate()
    return
