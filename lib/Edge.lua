local serpent = require("serpent")
local Edge
do
  local _class_0
  local _base_0 = { }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, options)
      self.src = {
        node = options.src.node,
        port = options.src.port
      }
      self.tgt = {
        node = options.tgt.node,
        port = options.tgt.port
      }
      self.metadata = options.metadata
    end,
    __base = _base_0,
    __name = "Edge"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Edge = _class_0
  return _class_0
end
