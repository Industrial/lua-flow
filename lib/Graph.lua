local serpent = require("serpent")
local Edge = require("Edge")
local Graph
do
  local _class_0
  local _base_0 = {
    get_edge_name = function(src_node, src_port, tgt_node, tgt_port)
      print("Graph#get_edge_name")
      return tostring(src_node) .. ":" .. tostring(src_port) .. "-" .. tostring(tgt_node) .. ":" .. tostring(tgt_port)
    end,
    clear = function(self, payload)
      print("Graph#clear")
      local id, main, baseDir
      id, main, baseDir = payload.id, payload.main, payload.baseDir
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
      self.base_dir = baseDir
      return {
        id = self.id,
        main = self.main,
        baseDir = self.base_dir
      }
    end,
    addnode = function(self)
      return print("Graph#addnode")
    end,
    removenode = function(self)
      return print("Graph#removenode")
    end,
    removenodeedges = function(self)
      return print("Graph#removenodeedges")
    end,
    renamenode = function(self)
      return print("Graph#renamenode")
    end,
    changenode = function(self)
      return print("Graph#changenode")
    end,
    addedge = function(self, payload)
      print("Graph#addedge")
      local src, tgt, metadata
      src, tgt, metadata = payload.src, payload.tgt, payload.metadata
      self.edges[self:get_edge_name(src.node, src.port, tgt.node, tgt.port)] = Edge(payload)
      return payload
    end,
    removeedge = function(self, payload)
      print("Graph#removeedge")
      local src, tgt
      src, tgt = payload.src, payload.tgt
      self.edges[self:get_edge_name(src.node, src.port, tgt.node, tgt.port)] = nil
    end,
    renameedge = function(self)
      return print("Graph#renameedge")
    end,
    changeedge = function(self)
      return print("Graph#changeedge")
    end,
    addinitial = function(self)
      return print("Graph#addinitial")
    end,
    removeinitial = function(self)
      return print("Graph#removeinitial")
    end,
    addinport = function(self)
      return print("Graph#addinport")
    end,
    removeinport = function(self)
      return print("Graph#removeinport")
    end,
    renameinport = function(self)
      return print("Graph#renameinport")
    end,
    addoutport = function(self)
      return print("Graph#addoutport")
    end,
    removeoutport = function(self)
      return print("Graph#removeoutport")
    end,
    renameoutport = function(self)
      return print("Graph#renameoutport")
    end,
    addgroup = function(self)
      return print("Graph#addgroup")
    end,
    removegroup = function(self)
      return print("Graph#removegroup")
    end,
    renamegroup = function(self)
      return print("Graph#renamegroup")
    end,
    changegroup = function(self)
      return print("Graph#changegroup")
    end,
    getstatus = function(self)
      return print("Graph#getstatus")
    end,
    start = function(self)
      return print("Graph#start")
    end,
    stop = function(self)
      return print("Graph#stop")
    end,
    persist = function(self)
      return print("Graph#persist")
    end,
    debug = function(self)
      return print("Graph#debug")
    end,
    getedges = function(self)
      return print("Graph#getedges")
    end,
    list = function(self)
      return print("Graph#list")
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, options)
      print("Graph#new")
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
      self.base_dir = nil
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
