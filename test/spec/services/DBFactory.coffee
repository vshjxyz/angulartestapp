'use strict'

describe 'Service: DBFactory', () ->

  # load the service's module
  beforeEach module 'TestApp'

  # instantiate service
  DBFactory = {}
  beforeEach inject (_DBFactory_) ->
    DBFactory = _DBFactory_

  it 'should do something', () ->
    expect(!!DBFactory).toBe true
