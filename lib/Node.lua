local Node
do
  local _class_0
  local _base_0 = {
    add_in_port = function(self, port)
      self.in_ports[port.name] = port
    end,
    remove_in_port = function(self, port)
      self.in_ports[port.name] = nil
    end,
    add_out_port = function(self, port)
      self.out_ports[port.name] = port
    end,
    remove_out_port = function(self, port)
      self.out_ports[port.name] = nil
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, options)
      self.name = options.name
      self.in_ports = { }
      self.out_ports = { }
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
