serpent = require "serpent"

Node = require "Node"
Port = require "Port"

describe "Node", ->
  describe "#new", ->
    it "should set an id", ->
      node = Node id: "Node"

      expected = "Node"
      actual = node.id

      assert.are.same expected, actual

    it "should set an in_ports table", ->
      node = Node id: "Node"

      expected = "table"
      actual = type node.in_ports

      assert.are.same expected, actual

    it "should set an out_ports table", ->
      node = Node id: "Node"

      expected = "table"
      actual = type node.out_ports

      assert.are.same expected, actual

  describe "#set_id", ->
    it "should set an id", ->
      node = Node id: "Node"
      node\set_id "Node1"

      expected = "Node1"
      actual = node.id

      assert.are.same expected, actual

  describe "#set_metadata", ->
    describe "when the current metadata table is empty", ->
      describe "when called with an empty metadata table", ->
        it "should leave an empty current metadata table", ->
          node = Node id: "Node"
          -- node\set_metadata {}

          expected = {}
          actual = node.metadata

          assert.are.same expected, actual

      describe "when called with a metadata table", ->
        it "should update the current metadata table with the new metadata values", ->
          node = Node id: "Node"
          node\set_metadata
            a: "b"
            c: "d"

          expected =
            a: "b"
            c: "d"
          actual = node.metadata

          assert.are.same expected, actual

    describe "when the metadata table is not empty", ->
      describe "when called with an empty metadata table", ->
        it "should leave the current metadata table in the same state", ->
          node = Node
            id: "Node"
            metadata:
              a: "b"
              c: "d"

          node\set_metadata {}

          expected =
            a: "b"
            c: "d"
          actual = node.metadata

          assert.are.same expected, actual

      describe "when called with a metadata table", ->
        it "should update the current metadata table with the new metadata values", ->
          node = Node
            id: "Node"
            metadata:
              A: "b"
              C: "d"

          node\set_metadata
            e: "f"
            g: "h"

          expected =
            A: "b"
            C: "d"
            e: "f"
            g: "h"
          actual = node.metadata

          assert.are.same expected, actual

  describe "#add_in_port", ->
    it "should add the port", ->
      node = Node id: "Node"
      port = Port id: "Port"

      node\add_in_port port

      expected = "Port"
      actual = node.in_ports.Port.id

      assert.are.same expected, actual

  describe "#remove_in_port", ->
    it "should remove the port", ->
      node = Node id: "Node"
      port = Port id: "Port"

      node\add_in_port port
      node\remove_in_port port

      expected = nil
      actual = node.in_ports.Port

      assert.are.same expected, actual

  describe "#add_out_port", ->
    it "should add the port", ->
      node = Node id: "Node"
      port = Port id: "Port"

      node\add_out_port port

      expected = "Port"
      actual = node.out_ports.Port.id

      assert.are.same expected, actual

  describe "#remove_out_port", ->
    it "should remove the port", ->
      node = Node id: "Node"
      port = Port id: "Port"

      node\add_out_port port
      node\remove_out_port port

      expected = nil
      actual = node.out_ports.Port

      assert.are.same expected, actual
