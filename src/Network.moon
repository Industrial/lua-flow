Graph = require "Graph"

class Network
  new: (options) =>
    -- print "Network#new"

    @id = "network"
    @graphs = {}

    @add_graph
      id: "main"

  add_graph: (options) =>
    -- print "Network#add_graph"

    import id from options
    assert id, "Network#add_graph:options.id"

    @graphs[id] = Graph
      id: id

  remove_graph: (options) =>
    -- print "Network#remove_graph"

    import id from options
    assert id, "Network#remove_graph:options.id"

    @graphs[id] = nil

  ensure_graph: (options) =>
    -- print "Network#ensure_graph"

    import id from options
    assert id, "Network#ensure_graph:options.id"

    @graphs[id] = @graphs[id] or Graph id: id
    @graphs[id]
