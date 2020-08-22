serpent = require "serpent"

class Edge
  new: (options) =>
    -- print "Edge#new"
    -- print "Edge#new:options", serpent.block options

    @src =
      node: options.src.node
      port: options.src.port

    @tgt =
      node: options.tgt.node
      port: options.tgt.port

    @metadata = options.metadata
