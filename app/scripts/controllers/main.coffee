'use strict'

angular.module('TestApp.controllers', []).controller 'MainCtrl', ['$scope', 'MyObject', ($scope, MyObject) ->
    MyObject.query().$then (objects) ->
        $scope.objects = objects.data
]