'use strict'

describe 'Controller: EditCtrl', () ->

  # load the controller's module
  beforeEach module 'TestApp'

  EditCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    EditCtrl = $controller 'EditCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
