Node = require "Node"
Port = require "Port"

describe "Node", ->
  describe "#new", ->
    it "should set an id", ->
      node = Node id: "Node"
      expected = "Node"
      actual = node.id

      assert.are.equal actual, expected

    it "should set an in_ports table", ->
      node = Node id: "Node"
      expected = "table"
      actual = type node.in_ports

      assert.are.same actual, expected

    it "should set an out_ports table", ->
      node = Node id: "Node"
      expected = "table"
      actual = type node.out_ports

      assert.are.same actual, expected

  describe "#set_id", ->
    it "should set an id", ->
      node = Node id: "Node"
      node\set_id "Node1"
      expected = "Node1"
      actual = node.id

      assert.are.equal actual, expected

  describe "#set_metadata", ->
    it "should set the metadata", ->
      node = Node id: "Node"
      node\set_metadata
        a: "b"
        c: "d"
      expected =
        a: "b"
        c: "d"
      actual = node.metadata

      assert.are.same actual, expected

  describe "#add_in_port", ->
    it "should add the port", ->
      node = Node id: "Node"
      port = Port id: "Port"
      node\add_in_port port

      expected = "Port"
      actual = node.in_ports.Port.id

      assert.are.same actual, expected

  describe "#remove_in_port", ->
    it "should remove the port", ->
      node = Node id: "Node"
      port = Port id: "Port"
      node\add_in_port port
      node\remove_in_port port

      expected = nil
      actual = node.in_ports.Port

      assert.are.same actual, expected

  describe "#add_out_port", ->
    it "should add the port", ->
      node = Node id: "Node"
      port = Port id: "Port"
      node\add_out_port port

      expected = "Port"
      actual = node.out_ports.Port.id

      assert.are.same actual, expected

  describe "#remove_out_port", ->
    it "should remove the port", ->
      node = Node id: "Node"
      port = Port id: "Port"
      node\add_out_port port
      node\remove_out_port port

      expected = nil
      actual = node.out_ports.Port

      assert.are.same actual, expected
