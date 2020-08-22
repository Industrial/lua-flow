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

    @graphs[options.id] = Graph
      id: options.id

  remove_graph: (options) =>
    -- print "Network#remove_graph"

    @graphs[options.id] = nil

  ensure_graph: (options) =>
    -- print "Network#ensure_graph"

    import id from options

    @graphs[id] = @graphs[id] or Graph id: id
    @graphs[id]
