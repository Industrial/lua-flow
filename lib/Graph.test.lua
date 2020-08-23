local Graph = require("Graph")
return describe("Graph", function()
  describe("#new", function()
    it("should set an id", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = "Graph"
      local actual = graph.id
      return assert.are.same(actual, expected)
    end)
    it("should set a nodes object", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = { }
      local actual = graph.nodes
      return assert.are.same(actual, expected)
    end)
    it("should set an edges object", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = { }
      local actual = graph.edges
      return assert.are.same(actual, expected)
    end)
    it("should set an initial object", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = { }
      local actual = graph.initial
      return assert.are.same(actual, expected)
    end)
    it("should set a components object", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = { }
      local actual = graph.components
      return assert.are.same(actual, expected)
    end)
    it("should set a main property", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = false
      local actual = graph.main
      return assert.are.same(actual, expected)
    end)
    it("should set a debugging property", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = false
      local actual = graph.debugging
      return assert.are.same(actual, expected)
    end)
    it("should set a running property", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = false
      local actual = graph.running
      return assert.are.same(actual, expected)
    end)
    it("should set a started property", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = false
      local actual = graph.started
      return assert.are.same(actual, expected)
    end)
    it("should set a start_time property", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = nil
      local actual = graph.start_time
      return assert.are.same(actual, expected)
    end)
    return it("should set a base_dir property", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = nil
      local actual = graph.base_dir
      return assert.are.same(actual, expected)
    end)
  end)
  describe("#addedge", function() end)
  describe("#addgroup", function() end)
  describe("#addinitial", function() end)
  describe("#addinport", function() end)
  describe("#addnode", function() end)
  describe("#addoutport", function() end)
  describe("#changeedge", function() end)
  describe("#changegroup", function() end)
  describe("#changenode", function() end)
  describe("#clear", function() end)
  describe("#debug", function() end)
  describe("#get_edge_name", function()
    return it("should get the edge name", function()
      local graph = Graph({
        id = "Graph"
      })
      local expected = "a:b-c:d"
      local actual = graph:get_edge_name("a", "b", "c", "d")
      return assert.are.same(actual, expected)
    end)
  end)
  describe("#getedges", function() end)
  describe("#getstatus", function() end)
  describe("#list", function() end)
  describe("#persist", function() end)
  describe("#removeedge", function() end)
  describe("#removegroup", function() end)
  describe("#removeinitial", function() end)
  describe("#removeinport", function() end)
  describe("#removenode", function() end)
  describe("#removenodeedges", function() end)
  describe("#removeoutport", function() end)
  describe("#renameedge", function() end)
  describe("#renamegroup", function() end)
  describe("#renameinport", function() end)
  describe("#renamenode", function() end)
  describe("#renameoutport", function() end)
  describe("#start", function() end)
  return describe("#stop", function() end)
end)
