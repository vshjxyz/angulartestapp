'use strict'

describe 'Service: MyObject', () ->

  # load the service's module
  beforeEach module 'TestApp'

  # instantiate service
  MyObject = {}
  beforeEach inject (_MyObject_) ->
    MyObject = _MyObject_

  it 'should do something', () ->
    expect(!!MyObject).toBe true
