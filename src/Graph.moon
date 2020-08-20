serpent = require "serpent"

Edge = require "Edge"

class Graph
  new: (options) =>
    print "Graph#new"

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
    print "Graph#get_edge_name"

    "#{src_node}:#{src_port}-#{tgt_node}:#{tgt_port}"

  clear: (payload) =>
    print "Graph#clear"

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

  addnode: () =>
    print "Graph#addnode"

  removenode: () =>
    print "Graph#removenode"

  removenodeedges: () =>
    print "Graph#removenodeedges"

  renamenode: () =>
    print "Graph#renamenode"

  changenode: () =>
    print "Graph#changenode"

  addedge: (payload) =>
    print "Graph#addedge"

    import src, tgt, metadata from payload

    @edges[@get_edge_name src.node, src.port, tgt.node, tgt.port] = Edge payload

    payload

  removeedge: (payload) =>
    print "Graph#removeedge"

    import src, tgt from payload

    @edges[@get_edge_name src.node, src.port, tgt.node, tgt.port] = nil

  renameedge: () =>
    print "Graph#renameedge"

  changeedge: () =>
    print "Graph#changeedge"

  addinitial: () =>
    print "Graph#addinitial"

  removeinitial: () =>
    print "Graph#removeinitial"

  addinport: () =>
    print "Graph#addinport"

  removeinport: () =>
    print "Graph#removeinport"

  renameinport: () =>
    print "Graph#renameinport"

  addoutport: () =>
    print "Graph#addoutport"

  removeoutport: () =>
    print "Graph#removeoutport"

  renameoutport: () =>
    print "Graph#renameoutport"

  addgroup: () =>
    print "Graph#addgroup"

  removegroup: () =>
    print "Graph#removegroup"

  renamegroup: () =>
    print "Graph#renamegroup"

  changegroup: () =>
    print "Graph#changegroup"

  getstatus: () =>
    print "Graph#getstatus"

  start: () =>
    print "Graph#start"

  stop: () =>
    print "Graph#stop"

  persist: () =>
    print "Graph#persist"

  debug: () =>
    print "Graph#debug"

  getedges: () =>
    print "Graph#getedges"

  list: () =>
    print "Graph#list"
