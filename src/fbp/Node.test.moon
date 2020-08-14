Node = require "src/fbp/Node"
Port = require "src/fbp/Port"

describe "Node", ->
  describe "#constructor", ->
    it "should set a name", ->
      node = Node name: "Node"
      expected = "Node"
      actual = node.name

      assert.are.equal actual, expected

    it "should set an in_ports table", ->
      node = Node name: "Node"
      expected = "table"
      actual = type node.in_ports

      assert.are.same actual, expected

    it "should set an out_ports table", ->
      node = Node name: "Node"
      expected = "table"
      actual = type node.out_ports

      assert.are.same actual, expected

  describe "#add_in_port", ->
    it "should add the port", ->
      node = Node name: "Node"
      port = Port name: "Port"
      node\add_in_port port

      expected = "Port"
      actual = node.in_ports.Port.name

      assert.are.same actual, expected

  describe "#remove_in_port", ->
    it "should remove the port", ->
      node = Node name: "Node"
      port = Port name: "Port"
      node\add_in_port port
      node\remove_in_port port

      expected = nil
      actual = node.in_ports.Port

      assert.are.same actual, expected

  describe "#add_out_port", ->
    it "should add the port", ->
      node = Node name: "Node"
      port = Port name: "Port"
      node\add_out_port port

      expected = "Port"
      actual = node.out_ports.Port.name

      assert.are.same actual, expected

  describe "#remove_out_port", ->
    it "should remove the port", ->
      node = Node name: "Node"
      port = Port name: "Port"
      node\add_out_port port
      node\remove_out_port port

      expected = nil
      actual = node.out_ports.Port

      assert.are.same actual, expected
