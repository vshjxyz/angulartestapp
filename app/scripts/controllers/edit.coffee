'use strict'

angular.module('TestApp.controllers').controller 'EditCtrl', ['$scope', '$routeParams', '$location', 'DBFactory', ($scope, $routeParams, $location, DBFactory) ->
    DBFactory.tables.Website.findBy(persistence, null, 'id', $routeParams.id, (websiteToEdit) ->
        if websiteToEdit?
            $scope.website = websiteToEdit.toJSON()
            if not ($scope.$$phase or $scope.$root.$$phase)
                $scope.$apply()
    )

    $scope.editWebsite = ->
        if $scope.websiteForm.$valid and DBFactory.tables.Website?
            DBFactory.tables.Website.findBy(persistence, null, 'id', $scope.website.id, (websiteToEdit) ->
                if websiteToEdit?
                    websiteToEdit.name = $scope.website.name
                    websiteToEdit.url = $scope.website.url

                    flush_callback = DBFactory.exceptionHandler ->
                        $scope.$apply ->
                            $location.path '/'
                    persistence.flush flush_callback
            )
]