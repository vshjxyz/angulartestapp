'use strict';

angular.module('TestApp.services').service 'DBFactory', () ->
    persistence.store.websql.config(persistence, 'TestDB', 'A database to test the shiet', 50 * 1024 * 1024)

    @tables =
        Website: persistence.define 'Website',
            name: "TEXT"
            url: "TEXT"

    persistence.schemaSync()

    @exceptionHandler = (callback) ->
        (result, error) ->
            if error?
                throw "SQLError code #{error.code}: #{error.message}"
            else
                callback.apply @, arguments
