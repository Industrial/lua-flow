local Graph = require("Graph")
local Network
do
  local _class_0
  local _base_0 = {
    add_graph = function(self, options)
      print("Network#add_graph")
      self.graphs[options.id] = Graph({
        id = options.id
      })
    end,
    remove_graph = function(self, options)
      print("Network#remove_graph")
      self.graphs[options.id] = nil
    end,
    ensure_graph = function(self, options)
      print("Network#ensure_graph")
      local id
      id = options.id
      self.graphs[id] = self.graphs[id] or Graph({
        id = id
      })
      return self.graphs[id]
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, options)
      print("Network#new")
      self.id = "network"
      self.graphs = { }
      return self:add_graph({
        id = "main"
      })
    end,
    __base = _base_0,
    __name = "Network"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Network = _class_0
  return _class_0
end
