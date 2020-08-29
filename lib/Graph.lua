package.path = package.path .. ';./nodes/?.lua'
local serpent = require("serpent")
local Edge = require("Edge")
local Graph
do
  local _class_0
  local _base_0 = {
    addedge = function(self, payload)
      local src, tgt, metadata, graph
      src, tgt, metadata, graph = payload.src, payload.tgt, payload.metadata, payload.graph
      self.edges[self:get_edge_name(src.node, src.port, tgt.node, tgt.port)] = Edge(payload)
      return {
        graph = graph,
        metadata = metadata,
        src = src,
        tgt = tgt
      }
    end,
    addgroup = function(self, payload)
      return print("Graph#addgroup")
    end,
    addinitial = function(self, payload)
      return print("Graph#addinitial")
    end,
    addinport = function(self, payload)
      return print("Graph#addinport")
    end,
    addnode = function(self, payload)
      local id, node, metadata, graph
      id, node, metadata, graph = payload.id, payload.node, payload.metadata, payload.graph
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
    addoutport = function(self, payload)
      return print("Graph#addoutport")
    end,
    changeedge = function(self, payload)
      return print("Graph#changeedge")
    end,
    changegroup = function(self, payload)
      return print("Graph#changegroup")
    end,
    changenode = function(self, payload)
      local id, metadata, graph
      id, metadata, graph = payload.id, payload.metadata, payload.graph
      local node = self.nodes[id]
      node:set_metadata(metadata)
      return {
        graph = graph,
        id = id,
        metadata = node.metadata
      }
    end,
    clear = function(self, payload)
      local id, main
      id, main = payload.id, payload.main
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
    debug = function(self, payload)
      return print("Graph#debug")
    end,
    get_edge_name = function(self, src_node, src_port, tgt_node, tgt_port)
      return tostring(src_node) .. ":" .. tostring(src_port) .. "-" .. tostring(tgt_node) .. ":" .. tostring(tgt_port)
    end,
    getedges = function(self, payload)
      return print("Graph#getedges")
    end,
    getstatus = function(self, payload)
      return print("Graph#getstatus")
    end,
    list = function(self, payload)
      return print("Graph#list")
    end,
    persist = function(self, payload)
      return print("Graph#persist")
    end,
    removeedge = function(self, payload)
      local src, tgt
      src, tgt = payload.src, payload.tgt
      self.edges[self:get_edge_name(src.node, src.port, tgt.node, tgt.port)] = nil
    end,
    removegroup = function(self, payload)
      return print("Graph#removegroup")
    end,
    removeinitial = function(self, payload)
      return print("Graph#removeinitial")
    end,
    removeinport = function(self, payload)
      return print("Graph#removeinport")
    end,
    removenode = function(self, payload)
      return print("Graph#removenode")
    end,
    removenodeedges = function(self, payload)
      return print("Graph#removenodeedges")
    end,
    removeoutport = function(self, payload)
      return print("Graph#removeoutport")
    end,
    renameedge = function(self, payload)
      return print("Graph#renameedge")
    end,
    renamegroup = function(self, payload)
      return print("Graph#renamegroup")
    end,
    renameinport = function(self, payload)
      return print("Graph#renameinport")
    end,
    renamenode = function(self, payload)
      return print("Graph#renamenode")
    end,
    renameoutport = function(self, payload)
      return print("Graph#renameoutport")
    end,
    start = function(self, payload)
      return print("Graph#start")
    end,
    stop = function(self, payload)
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
