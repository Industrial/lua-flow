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

  addedge: (options) =>
    -- print "Graph#addedge"

    import src, tgt, metadata, graph from options

    @edges[@get_edge_name src.node, src.port, tgt.node, tgt.port] = Edge options

    {
      graph: graph
      metadata: metadata
      src: src
      tgt: tgt
    }

  addgroup: (options) =>
    print "Graph#addgroup"

  addinitial: (options) =>
    -- print "Graph#addinitial"

    import graph, metadata, src, tgt from options

    -- TODO: metadata?

    @initial["#{tgt.node}:#{tgt.port}"] = src

    {
      graph: graph
      metadata: metadata
      src: src
      tgt: tgt
    }

  addinport: (options) =>
    print "Graph#addinport"

  addnode: (options) =>
    -- print "Graph#addnode"

    import id, node, metadata, graph from options

    node_dots = node\gsub "/", "."

    require_path = "nodes.#{node_dots}"

    NodeClass = require require_path

    @nodes[id] = NodeClass
      id: id
      metadata: metadata

    {
      graph: graph
      id: id
      metadata: metadata
      node: node
    }

  addoutport: (options) =>
    print "Graph#addoutport"

  changeedge: (options) =>
    print "Graph#changeedge"

  changegroup: (options) =>
    print "Graph#changegroup"

  changenode: (options) =>
    -- print "Graph#changenode"

    import id, metadata, graph from options

    node = @nodes[id]
    node\set_metadata metadata

    {
      graph: graph
      id: id
      metadata: node.metadata
    }

  clear: (options) =>
    -- print "Graph#clear"

    import id, main from options

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

  debug: (options) =>
    print "Graph#debug"

  get_edge_name: (src_node, src_port, tgt_node, tgt_port) =>
    -- print "Graph#get_edge_name"

    "#{src_node}:#{src_port}-#{tgt_node}:#{tgt_port}"

  getedges: (options) =>
    print "Graph#getedges"

  getstatus: (options) =>
    print "Graph#getstatus"

  list: (options) =>
    print "Graph#list"

  persist: (options) =>
    print "Graph#persist"

  removeedge: (options) =>
    -- print "Graph#removeedge"

    import src, tgt from options

    @edges[@get_edge_name src.node, src.port, tgt.node, tgt.port] = nil

  removegroup: (options) =>
    print "Graph#removegroup"

  removeinitial: (options) =>
    print "Graph#removeinitial"

  removeinport: (options) =>
    print "Graph#removeinport"

  removenode: (options) =>
    print "Graph#removenode"

  removenodeedges: (options) =>
    print "Graph#removenodeedges"

  removeoutport: (options) =>
    print "Graph#removeoutport"

  renameedge: (options) =>
    print "Graph#renameedge"

  renamegroup: (options) =>
    print "Graph#renamegroup"

  renameinport: (options) =>
    print "Graph#renameinport"

  renamenode: (options) =>
    print "Graph#renamenode"

  renameoutport: (options) =>
    print "Graph#renameoutport"

  start: (options) =>
    print "Graph#start"

  stop: (options) =>
    print "Graph#stop"
