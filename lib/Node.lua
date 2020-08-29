local serpent = require("serpent")
local JSON = require("JSON")
local Node
do
  local _class_0
  local _base_0 = {
    set_id = function(self, id)
      self.id = id
    end,
    set_metadata = function(self, metadata)
      for k, v in pairs(metadata) do
        if JSON:is_null(v) then
          self.metadata[k] = nil
        else
          self.metadata[k] = v
        end
      end
    end,
    add_in_port = function(self, port)
      self.in_ports[port.id] = port
    end,
    remove_in_port = function(self, port)
      self.in_ports[port.id] = nil
    end,
    add_out_port = function(self, port)
      self.out_ports[port.id] = port
    end,
    remove_out_port = function(self, port)
      self.out_ports[port.id] = nil
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, options)
      self.id = 'Node'
      self.metadata = { }
      self.in_ports = { }
      self.out_ports = { }
      local id, metadata
      id, metadata = options.id, options.metadata
      if id then
        self:set_id(id)
      end
      if metadata then
        return self:set_metadata(metadata)
      end
    end,
    __base = _base_0,
    __name = "Node"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Node = _class_0
  return _class_0
end
