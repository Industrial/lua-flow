Graph = require "Graph"

describe "Graph", ->
  describe "#new", ->
    it "should set an id", ->
      graph = Graph id: "Graph"
      expected = "Graph"
      actual = graph.id

      assert.are.same actual, expected

    it "should set a nodes object", ->
      graph = Graph id: "Graph"
      expected = {}
      actual = graph.nodes

      assert.are.same actual, expected

    it "should set an edges object", ->
      graph = Graph id: "Graph"
      expected = {}
      actual = graph.edges

      assert.are.same actual, expected

    it "should set an initial object", ->
      graph = Graph id: "Graph"
      expected = {}
      actual = graph.initial

      assert.are.same actual, expected

    it "should set a components object", ->
      graph = Graph id: "Graph"
      expected = {}
      actual = graph.components

      assert.are.same actual, expected

    it "should set a main property", ->
      graph = Graph id: "Graph"
      expected = false
      actual = graph.main

      assert.are.same actual, expected

    it "should set a debugging property", ->
      graph = Graph id: "Graph"
      expected = false
      actual = graph.debugging

      assert.are.same actual, expected

    it "should set a running property", ->
      graph = Graph id: "Graph"
      expected = false
      actual = graph.running

      assert.are.same actual, expected

    it "should set a started property", ->
      graph = Graph id: "Graph"
      expected = false
      actual = graph.started

      assert.are.same actual, expected

    it "should set a start_time property", ->
      graph = Graph id: "Graph"
      expected = nil
      actual = graph.start_time

      assert.are.same actual, expected

    it "should set a base_dir property", ->
      graph = Graph id: "Graph"
      expected = nil
      actual = graph.base_dir

      assert.are.same actual, expected

  describe "#addedge", ->

  describe "#addgroup", ->

  describe "#addinitial", ->

  describe "#addinport", ->

  describe "#addnode", ->

  describe "#addoutport", ->

  describe "#changeedge", ->

  describe "#changegroup", ->

  describe "#changenode", ->

  describe "#clear", ->

  describe "#debug", ->

  describe "#get_edge_name", ->
    it "should get the edge name", ->
      graph = Graph id: "Graph"
      expected = "a:b-c:d"
      actual = graph\get_edge_name "a", "b", "c", "d"

      assert.are.same actual, expected

  describe "#getedges", ->

  describe "#getstatus", ->

  describe "#list", ->

  describe "#persist", ->

  describe "#removeedge", ->

  describe "#removegroup", ->

  describe "#removeinitial", ->

  describe "#removeinport", ->

  describe "#removenode", ->

  describe "#removenodeedges", ->

  describe "#removeoutport", ->

  describe "#renameedge", ->

  describe "#renamegroup", ->

  describe "#renameinport", ->

  describe "#renamenode", ->

  describe "#renameoutport", ->

  describe "#start", ->

  describe "#stop", ->
