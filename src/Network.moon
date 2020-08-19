Graph = require "Graph"

class Network
  new: (options) =>
    @id = "network"
    @graphs = {}

    @add_graph
      id: "main"

  add_graph: (options) =>
    @graphs[options.id] = Graph
      id: options.id

  remove_graph: (options) =>
    @graphs[options.id] = nil

  ensure_graph: (options) =>
    import id from options

    print "ensure_graph", id

    @graphs[id] = @graphs[id] or Graph
      id: id
    @graphs[id]
