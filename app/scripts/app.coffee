'use strict'

angular.module('TestApp', ['TestApp.controllers', 'TestApp.services'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/edit/:id',
        templateUrl: 'views/edit.html'
        controller: 'EditCtrl'
      .otherwise
        redirectTo: '/'

angular.module('TestApp.services', ['ngResource'])
angular.module('TestApp.controllers', ['TestApp.services'])
