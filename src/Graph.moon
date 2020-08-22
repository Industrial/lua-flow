serpent = require "serpent"

Edge = require "Edge"

class Graph
  new: (options) =>
    -- print "Graph#new"

    @id = options.id
    @nodes = {}
    @edges = {}
    @initial = {}
    @components = {}
    @main = false
    @debugging = false
    @running = false
    @started = false
    @start_time = nil
    @base_dir = nil

  get_edge_name: (src_node, src_port, tgt_node, tgt_port) ->
    -- print "Graph#get_edge_name"

    "#{src_node}:#{src_port}-#{tgt_node}:#{tgt_port}"

  clear: (payload) =>
    -- print "Graph#clear"

    import id, main, baseDir from payload

    @id = id
    @nodes = {}
    @edges = {}
    @initial = {}
    @components = {}
    @main = main
    @debugging = false
    @running = false
    @started = false
    @start_time = nil
    @base_dir = baseDir

    {
      id: @id
      main: @main
      baseDir: @base_dir
    }

  addnode: (payload) =>
    print "Graph#addnode"

  removenode: (payload) =>
    print "Graph#removenode"

  removenodeedges: (payload) =>
    print "Graph#removenodeedges"

  renamenode: (payload) =>
    print "Graph#renamenode"

  changenode: (payload) =>
    print "Graph#changenode"

    import id, metadata from payload

    print "Graph#changenode:id", id
    print "Graph#changenode:metadata", metadata

  addedge: (payload) =>
    print "Graph#addedge"

    import src, tgt, metadata from payload

    @edges[@get_edge_name src.node, src.port, tgt.node, tgt.port] = Edge payload

    payload

  removeedge: (payload) =>
    print "Graph#removeedge"

    import src, tgt from payload

    @edges[@get_edge_name src.node, src.port, tgt.node, tgt.port] = nil

  renameedge: (payload) =>
    print "Graph#renameedge"

  changeedge: (payload) =>
    print "Graph#changeedge"

  addinitial: (payload) =>
    print "Graph#addinitial"

  removeinitial: (payload) =>
    print "Graph#removeinitial"

  addinport: (payload) =>
    print "Graph#addinport"

  removeinport: (payload) =>
    print "Graph#removeinport"

  renameinport: (payload) =>
    print "Graph#renameinport"

  addoutport: (payload) =>
    print "Graph#addoutport"

  removeoutport: (payload) =>
    print "Graph#removeoutport"

  renameoutport: (payload) =>
    print "Graph#renameoutport"

  addgroup: (payload) =>
    print "Graph#addgroup"

  removegroup: (payload) =>
    print "Graph#removegroup"

  renamegroup: (payload) =>
    print "Graph#renamegroup"

  changegroup: (payload) =>
    print "Graph#changegroup"

  getstatus: (payload) =>
    print "Graph#getstatus"

  start: (payload) =>
    print "Graph#start"

  stop: (payload) =>
    print "Graph#stop"

  persist: (payload) =>
    print "Graph#persist"

  debug: (payload) =>
    print "Graph#debug"

  getedges: (payload) =>
    print "Graph#getedges"

  list: (payload) =>
    print "Graph#list"
