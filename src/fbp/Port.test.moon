Port = require "src/fbp/Port"

describe "Port", ->
  describe "#constructor", ->
    it "should set a name", ->
      port = Port name: "Port"
      expected = "Port"
      actual = port.name

      assert.are.equal actual, expected