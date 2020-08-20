serpent = require "serpent"

class Edge
  new: (options) =>
    print "Edge#new"

    @src = options.src
    @tgt = options.tgt
    @metadata = options.metadata
