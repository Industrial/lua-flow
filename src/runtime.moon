package.path = "?;?.lua;lib/?.lua;#{package.path}"

Runtime = require "Runtime"

options =
  host: "0.0.0.0"
  port: tonumber arg[1] or 3001

runtime = Runtime options

runtime\start!
