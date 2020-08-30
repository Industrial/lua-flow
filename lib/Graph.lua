package.path = package.path .. ';./nodes/?.lua'
local serpent = require("serpent")
local Edge = require("Edge")
local Graph
do
  local _class_0
  local _base_0 = {
    addedge = function(self, options)
      local src, tgt, metadata, graph
      src, tgt, metadata, graph = options.src, options.tgt, options.metadata, options.graph
      self.edges[self:get_edge_name(src.node, src.port, tgt.node, tgt.port)] = Edge(options)
      return {
        graph = graph,
        metadata = metadata,
        src = src,
        tgt = tgt
      }
    end,
    addgroup = function(self, options)
      return print("Graph#addgroup")
    end,
    addinitial = function(self, options)
      local graph, metadata, src, tgt
      graph, metadata, src, tgt = options.graph, options.metadata, options.src, options.tgt
      self.initial[tostring(tgt.node) .. ":" .. tostring(tgt.port)] = src
      return {
        graph = graph,
        metadata = metadata,
        src = src,
        tgt = tgt
      }
    end,
    addinport = function(self, options)
      return print("Graph#addinport")
    end,
    addnode = function(self, options)
      local id, node, metadata, graph
      id, node, metadata, graph = options.id, options.node, options.metadata, options.graph
      local node_dots = node:gsub("/", ".")
      local require_path = "nodes." .. tostring(node_dots)
      local NodeClass = require(require_path)
      self.nodes[id] = NodeClass({
        id = id,
        metadata = metadata
      })
      return {
        graph = graph,
        id = id,
        metadata = metadata,
        node = node
      }
    end,
    addoutport = function(self, options)
      return print("Graph#addoutport")
    end,
    changeedge = function(self, options)
      return print("Graph#changeedge")
    end,
    changegroup = function(self, options)
      return print("Graph#changegroup")
    end,
    changenode = function(self, options)
      local id, metadata, graph
      id, metadata, graph = options.id, options.metadata, options.graph
      local node = self.nodes[id]
      node:set_metadata(metadata)
      return {
        graph = graph,
        id = id,
        metadata = node.metadata
      }
    end,
    clear = function(self, options)
      local id, main
      id, main = options.id, options.main
      self.id = id
      self.nodes = { }
      self.edges = { }
      self.initial = { }
      self.components = { }
      self.main = main
      self.debugging = false
      self.running = false
      self.started = false
      self.start_time = nil
      return {
        id = self.id,
        main = self.main
      }
    end,
    debug = function(self, options)
      return print("Graph#debug")
    end,
    get_edge_name = function(self, src_node, src_port, tgt_node, tgt_port)
      return tostring(src_node) .. ":" .. tostring(src_port) .. "-" .. tostring(tgt_node) .. ":" .. tostring(tgt_port)
    end,
    getedges = function(self, options)
      return print("Graph#getedges")
    end,
    getstatus = function(self, options)
      return print("Graph#getstatus")
    end,
    list = function(self, options)
      return print("Graph#list")
    end,
    persist = function(self, options)
      return print("Graph#persist")
    end,
    removeedge = function(self, options)
      local src, tgt
      src, tgt = options.src, options.tgt
      self.edges[self:get_edge_name(src.node, src.port, tgt.node, tgt.port)] = nil
    end,
    removegroup = function(self, options)
      return print("Graph#removegroup")
    end,
    removeinitial = function(self, options)
      return print("Graph#removeinitial")
    end,
    removeinport = function(self, options)
      return print("Graph#removeinport")
    end,
    removenode = function(self, options)
      return print("Graph#removenode")
    end,
    removenodeedges = function(self, options)
      return print("Graph#removenodeedges")
    end,
    removeoutport = function(self, options)
      return print("Graph#removeoutport")
    end,
    renameedge = function(self, options)
      return print("Graph#renameedge")
    end,
    renamegroup = function(self, options)
      return print("Graph#renamegroup")
    end,
    renameinport = function(self, options)
      return print("Graph#renameinport")
    end,
    renamenode = function(self, options)
      return print("Graph#renamenode")
    end,
    renameoutport = function(self, options)
      return print("Graph#renameoutport")
    end,
    start = function(self, options)
      return print("Graph#start")
    end,
    stop = function(self, options)
      return print("Graph#stop")
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, options)
      self.id = options.id
      self.nodes = { }
      self.edges = { }
      self.initial = { }
      self.components = { }
      self.main = false
      self.debugging = false
      self.running = false
      self.started = false
      self.start_time = nil
    end,
    __base = _base_0,
    __name = "Graph"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Graph = _class_0
  return _class_0
end
