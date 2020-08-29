local serpent = require("serpent")
local cjson = require("cjson")
local JSON
do
  local _class_0
  local _base_0 = {
    encode = function(self, input)
      return cjson.encode(input)
    end,
    decode = function(self, input)
      return cjson.decode(input)
    end,
    is_null = function(self, value)
      return value == cjson.null
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "JSON"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  JSON = _class_0
  return _class_0
end
