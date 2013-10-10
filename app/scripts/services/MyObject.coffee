'use strict';

angular.module('TestApp.services').factory 'MyObject', ['$resource', '$http', ($resource, $http) ->
    $resource 'http://localhost:8000\:8000/Website/Website/Websitelist/:id', { id: '@id' }, {
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
