local serpent = require("serpent")
local Graph
do
  local _class_0
  local _base_0 = {
    clear = function(self, payload)
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
    addnode = function(self) end,
    removenode = function(self) end,
    removenodeedges = function(self) end,
    renamenode = function(self) end,
    changenode = function(self) end,
    addedge = function(self, payload)
      return print("addedge", serpent.block(payload))
    end,
    removeedge = function(self) end,
    renameedge = function(self) end,
    changeedge = function(self) end,
    addinitial = function(self) end,
    removeinitial = function(self) end,
    addinport = function(self) end,
    removeinport = function(self) end,
    renameinport = function(self) end,
    addoutport = function(self) end,
    removeoutport = function(self) end,
    renameoutport = function(self) end,
    addgroup = function(self) end,
    removegroup = function(self) end,
    renamegroup = function(self) end,
    changegroup = function(self) end,
    getstatus = function(self) end,
    start = function(self) end,
    stop = function(self) end,
    persist = function(self) end,
    debug = function(self) end,
    getedges = function(self) end,
    list = function(self) end
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
