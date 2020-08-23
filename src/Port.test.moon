Port = require "Port"

describe "Port", ->
  describe "#new", ->
    it "should set an id", ->
      port = Port id: "Port"
      expected = "Port"
      actual = port.id

      assert.are.equal actual, expected
