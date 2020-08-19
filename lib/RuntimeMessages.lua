local json = require("dkjson")
local RuntimeMessages
do
  local _class_0
  local _base_0 = {
    component = {
      output = {
        Component = function(options)
          return {
            protocol = "component",
            command = "component",
            payload = {
              name = options.name,
              description = options.description,
              icon = options.icon,
              subgraph = options.subgraph,
              inPorts = options.inPorts,
              outPorts = options.outPorts
            }
          }
        end,
        ComponentsReady = function(options)
          return {
            protocol = "component",
            command = "componentsready",
            payload = options.count
          }
        end,
        Error = function(options)
          return {
            protocol = "component",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        Source = function(options)
          return {
            protocol = "component",
            command = "source",
            payload = {
              name = options.name,
              language = options.language,
              library = options.library,
              code = options.code,
              tests = options.tests
            }
          }
        end
      }
    },
    graph = {
      output = {
        AddEdge = function(options)
          return { }
        end,
        AddGroup = function(options)
          return { }
        end,
        AddInitial = function(options)
          return { }
        end,
        AddInPort = function(options)
          return { }
        end,
        AddNode = function(options)
          return { }
        end,
        AddOutPort = function(options)
          return { }
        end,
        ChangeEdge = function(options)
          return { }
        end,
        ChangeGroup = function(options)
          return { }
        end,
        ChangeNode = function(options)
          return { }
        end,
        Clear = function(options)
          return {
            protocol = "graph",
            command = "clear",
            payload = {
              id = options.id,
              main = options.main,
              baseDir = options.baseDir
            }
          }
        end,
        Error = function(options)
          return {
            protocol = "graph",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        RemoveEdge = function(options)
          return { }
        end,
        RemoveGroup = function(options)
          return { }
        end,
        RemoveInitial = function(options)
          return { }
        end,
        RemoveInPort = function(options)
          return { }
        end,
        RemoveNode = function(options)
          return { }
        end,
        RemoveOutPort = function(options)
          return { }
        end,
        RenameGroup = function(options)
          return { }
        end,
        RenameInPort = function(options)
          return { }
        end,
        RenameNode = function(options)
          return { }
        end,
        RenameOutPort = function(options)
          return { }
        end
      }
    },
    network = {
      output = {
        BeginGroup = function(options)
          return { }
        end,
        Connect = function(options)
          return { }
        end,
        Data = function(options)
          return { }
        end,
        Disconnect = function(options)
          return { }
        end,
        Edges = function(options)
          return { }
        end,
        EndGroup = function(options)
          return { }
        end,
        Error = function(options)
          return {
            protocol = "network",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        Icon = function(options)
          return { }
        end,
        Output = function(options)
          return { }
        end,
        ProcessError = function(options)
          return { }
        end,
        Started = function(options)
          return { }
        end,
        Status = function(options)
          return { }
        end,
        Stop = function(options)
          return { }
        end
      }
    },
    runtime = {
      output = {
        Error = function(options)
          return {
            protocol = "runtime",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        Packet = function(options)
          return {
            protocol = "runtime",
            command = "packet",
            payload = {
              port = options.port,
              event = options.event,
              type = options.type,
              schema = options.schema,
              payload = options.payload,
              graph = options.graph
            }
          }
        end,
        PacketSent = function(options)
          return {
            protocol = "runtime",
            command = "packetsent",
            payload = { }
          }
        end,
        Ports = function(options)
          return {
            protocol = "runtime",
            command = "ports",
            payload = {
              inPorts = options.inPorts,
              outPorts = options.outPorts,
              graph = options.graph
            }
          }
        end,
        Runtime = function(options)
          return {
            protocol = "runtime",
            command = "runtime",
            payload = {
              id = options.id,
              label = options.label,
              version = options.version,
              allCapabilities = options.allCapabilities,
              capabilities = options.capabilities,
              graph = options.graph,
              type = options.type,
              namespace = options.namespace,
              repository = options.repository,
              repositoryVersion = options.reposutoryVersion
            }
          }
        end
      }
    },
    trace = {
      output = {
        Clear = function(options)
          return { }
        end,
        Dump = function(options)
          return { }
        end,
        Error = function(options)
          return {
            protocol = "trace",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        Start = function(options)
          return { }
        end,
        Stop = function(options)
          return { }
        end
      }
    }
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "RuntimeMessages"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  RuntimeMessages = _class_0
  return _class_0
end
