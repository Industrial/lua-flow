package.path = package.path .. ';./nodes/?.lua'

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

  addedge: (payload) =>
    -- print "Graph#addedge"

    import src, tgt, metadata from payload

    @edges[@get_edge_name src.node, src.port, tgt.node, tgt.port] = Edge payload

    payload

  addgroup: (payload) =>
    print "Graph#addgroup"

  addinitial: (payload) =>
    print "Graph#addinitial"

  addinport: (payload) =>
    print "Graph#addinport"

  addnode: (payload) =>
    -- print "Graph#addnode"

    import id, node, metadata from payload

    node_dots = node\gsub "/", "."

    require_path = "nodes.#{node_dots}"

    NodeClass = require require_path

    @nodes[id] = NodeClass
      id: id
      metadata: metadata

    {
      id: id
      metadata: metadata
      node: node
    }

  addoutport: (payload) =>
    print "Graph#addoutport"

  changeedge: (payload) =>
    print "Graph#changeedge"

  changegroup: (payload) =>
    print "Graph#changegroup"

  changenode: (payload) =>
    print "Graph#changenode"
    print "Graph#changenode:payload", serpent.block payload

    import id, metadata from payload

    print "Graph#changenode:id", id
    print "Graph#changenode:metadata", serpent.block metadata

    @nodes[id]\set_metadata metadata

    payload

  clear: (payload) =>
    -- print "Graph#clear"

    import id, main from payload

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

    {
      id: @id
      main: @main
    }

  debug: (payload) =>
    print "Graph#debug"

  get_edge_name: (src_node, src_port, tgt_node, tgt_port) =>
    -- print "Graph#get_edge_name"

    "#{src_node}:#{src_port}-#{tgt_node}:#{tgt_port}"

  getedges: (payload) =>
    print "Graph#getedges"

  getstatus: (payload) =>
    print "Graph#getstatus"

  list: (payload) =>
    print "Graph#list"

  persist: (payload) =>
    print "Graph#persist"

  removeedge: (payload) =>
    -- print "Graph#removeedge"

    import src, tgt from payload

    @edges[@get_edge_name src.node, src.port, tgt.node, tgt.port] = nil

  removegroup: (payload) =>
    print "Graph#removegroup"

  removeinitial: (payload) =>
    print "Graph#removeinitial"

  removeinport: (payload) =>
    print "Graph#removeinport"

  removenode: (payload) =>
    print "Graph#removenode"

  removenodeedges: (payload) =>
    print "Graph#removenodeedges"

  removeoutport: (payload) =>
    print "Graph#removeoutport"

  renameedge: (payload) =>
    print "Graph#renameedge"

  renamegroup: (payload) =>
    print "Graph#renamegroup"

  renameinport: (payload) =>
    print "Graph#renameinport"

  renamenode: (payload) =>
    print "Graph#renamenode"

  renameoutport: (payload) =>
    print "Graph#renameoutport"

  start: (payload) =>
    print "Graph#start"

  stop: (payload) =>
    print "Graph#stop"
