'use strict';

angular.module('TestApp.services', ['ngResource']).factory 'MyObject',['$resource', '$http', ($resource, $http) ->
    $resource 'http://localhost:8000\:8000/pos/pos/poslist/', {}, {
        query:
            method: 'GET'
            isArray: true
            transformResponse: $http.defaults.transformResponse.concat [(data, headersGetter) ->
                if data? and data isnt ''
                    result = data.objects
                    result.meta = data.meta
                    result
            ]
    }
]