package.path = "?;?.lua;lib/?.lua;" .. tostring(package.path)
local Runtime = require("Runtime")
local options = {
  host = "0.0.0.0",
  port = tonumber(arg[1] or 3001)
}
local runtime = Runtime(options)
return runtime:start()
