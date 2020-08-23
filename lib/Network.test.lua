local Network = require("Network")
return describe("Network", function()
  describe("#new", function()
    it("should set an id", function()
      local network = Network()
      local expected = "network"
      local actual = network.id
      return assert.are.equal(actual, expected)
    end)
    return it("should set a graphs property with a default graph", function()
      local network = Network()
      local expected = "main"
      local actual = network.graphs.main.id
      return assert.are.same(actual, expected)
    end)
  end)
  describe("#add_graph", function()
    return it("should add a graph", function()
      local network = Network()
      network:add_graph({
        id = "Graph"
      })
      local expected = "Graph"
      local actual = network.graphs.Graph.id
      return assert.are.same(actual, expected)
    end)
  end)
  describe("#remove_graph", function()
    return it("should remove a graph", function()
      local network = Network()
      network:add_graph({
        id = "Graph"
      })
      network:remove_graph({
        id = "Graph"
      })
      local expected = nil
      local actual = network.graphs.Graph
      return assert.are.same(actual, expected)
    end)
  end)
  return describe("#ensure_graph", function()
    return it("should return or add and return a graph", function()
      local network = Network()
      local graph = network:ensure_graph({
        id = "Graph"
      })
      local expected = "Graph"
      local actual = graph.id
      return assert.are.same(actual, expected)
    end)
  end)
end)
