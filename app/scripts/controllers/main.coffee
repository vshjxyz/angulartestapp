'use strict'

angular.module('TestApp.controllers').controller 'MainCtrl', ['$scope', 'MyObject', 'DBFactory', ($scope, MyObject, DBFactory) ->

    $scope.addWebsite = ->
        if $scope.websiteForm.$valid and DBFactory.tables.Website?
            $scope.Website = angular.copy $scope.newWebsite
            Website = new DBFactory.tables.Website
                name: $scope.Website.name
                url: $scope.Website.url
            persistence.add Website
            flush_callback = DBFactory.exceptionHandler ->
                $scope.objects.push Website.toJSON()
                $scope.alert_visible = 'views/alert.html'
                $scope.newWebsite = null
                $scope.websiteForm.$setPristine(true)
                $scope.$apply()
            persistence.flush flush_callback

    $scope.deleteWebsite = (objectIndex, websiteData) ->
        if DBFactory.tables.Website?
            websiteEntity = DBFactory.tables.Website.findBy(persistence, null, 'id', websiteData.id, (websiteToRemove) ->
                if websiteToRemove?
                    persistence.remove websiteToRemove

                    flush_callback = DBFactory.exceptionHandler ->
                        $scope.objects.splice objectIndex, 1
                        $scope.$apply()
                    persistence.flush flush_callback
            )

    $scope.refreshData = ->
        $scope.objects = []
        if DBFactory.tables.Website?
            all_Website = DBFactory.tables.Website.all()
            all_Website.list null, (websiteList) ->
                for Website in websiteList
                    $scope.objects.push Website.toJSON()
                    # Trigger the scope cycle if we have getted all the objects
                    if $scope.objects.length is websiteList.length
                        $scope.$apply()

    $scope.refreshData()
]
