Network = require "Network"

describe "Network", ->
  describe "#new", ->
    it "should set an id", ->
      network = Network!
      expected = "network"
      actual = network.id

      assert.are.equal actual, expected

    it "should set a graphs property with a default graph", ->
      network = Network!
      expected = "main"
      actual = network.graphs.main.id

      assert.are.same actual, expected

  describe "#add_graph", ->
    it "should add a graph", ->
      network = Network!
      network\add_graph id: "Graph"
      expected = "Graph"
      actual = network.graphs.Graph.id

      assert.are.same actual, expected

  describe "#remove_graph", ->
    it "should remove a graph", ->
      network = Network!
      network\add_graph id: "Graph"
      network\remove_graph id: "Graph"
      expected = nil
      actual = network.graphs.Graph

      assert.are.same actual, expected

  describe "#ensure_graph", ->
    it "should return or add and return a graph", ->
      network = Network!
      graph = network\ensure_graph id: "Graph"
      expected = "Graph"
      actual = graph.id

      assert.are.same actual, expected
