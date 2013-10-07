'use strict'

angular.module('TestApp', ['TestApp.controllers', 'TestApp.services'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .otherwise
        redirectTo: '/'
