local serpent = require("serpent")
local RuntimeMessages
do
  local _class_0
  local _base_0 = {
    component = {
      input = {
        getsource = function(options)
          return {
            protocol = "component",
            command = "getsource",
            payload = {
              name = options.name
            }
          }
        end,
        list = function(options)
          return {
            protocol = "component",
            command = "list",
            payload = { }
          }
        end,
        source = function(options)
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
      },
      output = {
        component = function(options)
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
        componentsready = function(options)
          return {
            protocol = "component",
            command = "componentsready",
            payload = options.count
          }
        end,
        error = function(options)
          return {
            protocol = "component",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        source = function(options)
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
      input = {
        addedge = function(options)
          return {
            protocol = "graph",
            command = "addedge",
            payload = {
              graph = options.graph,
              metadata = options.metadata,
              src = {
                node = options.src.node,
                port = options.src.port
              },
              tgt = {
                node = options.tgt.node,
                port = options.tgt.port
              }
            }
          }
        end,
        addgroup = function(options)
          print("RuntimeMessages.graph.input.addgroup:options", serpent.block(options))
          return { }
        end,
        addinitial = function(options)
          print("RuntimeMessages.graph.input.addinitial:options", serpent.block(options))
          return { }
        end,
        addinport = function(options)
          print("RuntimeMessages.graph.input.addinport:options", serpent.block(options))
          return { }
        end,
        addnode = function(options)
          print("RuntimeMessages.graph.input.addnode:options", serpent.block(options))
          return { }
        end,
        addoutport = function(options)
          print("RuntimeMessages.graph.input.addoutport:options", serpent.block(options))
          return { }
        end,
        changeedge = function(options)
          print("RuntimeMessages.graph.input.changeedge:options", serpent.block(options))
          return { }
        end,
        changegroup = function(options)
          print("RuntimeMessages.graph.input.changegroup:options", serpent.block(options))
          return { }
        end,
        changenode = function(options)
          return {
            protocol = "graph",
            command = "changenode",
            payload = {
              graph = options.graph,
              id = options.id,
              metadata = options.metadata
            }
          }
        end,
        clear = function(options)
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
        error = function(options)
          return {
            protocol = "graph",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        removeedge = function(options)
          print("RuntimeMessages.graph.input.removeedge:options", serpent.block(options))
          return { }
        end,
        removegroup = function(options)
          print("RuntimeMessages.graph.input.removegroup:options", serpent.block(options))
          return { }
        end,
        removeinitial = function(options)
          print("RuntimeMessages.graph.input.removeinitial:options", serpent.block(options))
          return { }
        end,
        removeinport = function(options)
          print("RuntimeMessages.graph.input.removeinport:options", serpent.block(options))
          return { }
        end,
        removenode = function(options)
          print("RuntimeMessages.graph.input.removenode:options", serpent.block(options))
          return { }
        end,
        removeoutport = function(options)
          print("RuntimeMessages.graph.input.removeoutport:options", serpent.block(options))
          return { }
        end,
        renamegroup = function(options)
          print("RuntimeMessages.graph.input.renamegroup:options", serpent.block(options))
          return { }
        end,
        renameinport = function(options)
          print("RuntimeMessages.graph.input.renameinport:options", serpent.block(options))
          return { }
        end,
        renamenode = function(options)
          print("RuntimeMessages.graph.input.renamenode:options", serpent.block(options))
          return { }
        end,
        renameoutport = function(options)
          print("RuntimeMessages.graph.input.renameoutport:options", serpent.block(options))
          return { }
        end
      },
      output = {
        addedge = function(options)
          return {
            protocol = "graph",
            command = "addedge",
            payload = {
              src = options.src,
              tgt = options.tgt,
              metadata = options.metadata
            }
          }
        end,
        addgroup = function(options)
          print("RuntimeMessages.graph.output.addgroup:options", serpent.block(options))
          return { }
        end,
        addinitial = function(options)
          print("RuntimeMessages.graph.output.addinitial:options", serpent.block(options))
          return { }
        end,
        addinport = function(options)
          print("RuntimeMessages.graph.output.addinport:options", serpent.block(options))
          return { }
        end,
        addnode = function(options)
          print("RuntimeMessages.graph.output.addnode:options", serpent.block(options))
          return { }
        end,
        addoutport = function(options)
          print("RuntimeMessages.graph.output.addoutport:options", serpent.block(options))
          return { }
        end,
        changeedge = function(options)
          print("RuntimeMessages.graph.output.changeedge:options", serpent.block(options))
          return { }
        end,
        changegroup = function(options)
          print("RuntimeMessages.graph.output.changegroup:options", serpent.block(options))
          return { }
        end,
        changenode = function(options)
          return {
            protocol = "graph",
            command = "changenode",
            payload = {
              graph = options.graph,
              id = options.id,
              metadata = options.metadata
            }
          }
        end,
        clear = function(options)
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
        error = function(options)
          return {
            protocol = "graph",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        removeedge = function(options)
          print("RuntimeMessages.graph.output.removeedge:options", serpent.block(options))
          return { }
        end,
        removegroup = function(options)
          print("RuntimeMessages.graph.output.removegroup:options", serpent.block(options))
          return { }
        end,
        removeinitial = function(options)
          print("RuntimeMessages.graph.output.removeinitial:options", serpent.block(options))
          return { }
        end,
        removeinport = function(options)
          print("RuntimeMessages.graph.output.removeinport:options", serpent.block(options))
          return { }
        end,
        removenode = function(options)
          print("RuntimeMessages.graph.output.removenode:options", serpent.block(options))
          return { }
        end,
        removeoutport = function(options)
          print("RuntimeMessages.graph.output.removeoutport:options", serpent.block(options))
          return { }
        end,
        renamegroup = function(options)
          print("RuntimeMessages.graph.output.renamegroup:options", serpent.block(options))
          return { }
        end,
        renameinport = function(options)
          print("RuntimeMessages.graph.output.renameinport:options", serpent.block(options))
          return { }
        end,
        renamenode = function(options)
          print("RuntimeMessages.graph.output.renamenode:options", serpent.block(options))
          return { }
        end,
        renameoutport = function(options)
          print("RuntimeMessages.graph.output.renameoutport:options", serpent.block(options))
          return { }
        end
      }
    },
    network = {
      input = {
        debug = function(options)
          print("RuntimeMessages.network.input.debug:options", serpent.block(options))
          return { }
        end,
        edges = function(options)
          print("RuntimeMessages.network.input.edges:options", serpent.block(options))
          return { }
        end,
        getstatus = function(options)
          print("RuntimeMessages.network.input.getstatus:options", serpent.block(options))
          return { }
        end,
        persist = function(options)
          print("RuntimeMessages.network.input.persist:options", serpent.block(options))
          return { }
        end,
        start = function(options)
          print("RuntimeMessages.network.input.start:options", serpent.block(options))
          return { }
        end,
        stop = function(options)
          print("RuntimeMessages.network.input.stop:options", serpent.block(options))
          return { }
        end
      },
      output = {
        begingroup = function(options)
          print("RuntimeMessages.network.output.begingroup:options", serpent.block(options))
          return { }
        end,
        connect = function(options)
          print("RuntimeMessages.network.output.connect:options", serpent.block(options))
          return { }
        end,
        data = function(options)
          print("RuntimeMessages.network.output.data:options", serpent.block(options))
          return { }
        end,
        disconnect = function(options)
          print("RuntimeMessages.network.output.disconnect:options", serpent.block(options))
          return { }
        end,
        edges = function(options)
          print("RuntimeMessages.network.output.edges:options", serpent.block(options))
          return { }
        end,
        endgroup = function(options)
          print("RuntimeMessages.network.output.endgroup:options", serpent.block(options))
          return { }
        end,
        error = function(options)
          return {
            protocol = "network",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        icon = function(options)
          print("RuntimeMessages.network.output.icon:options", serpent.block(options))
          return { }
        end,
        output = function(options)
          print("RuntimeMessages.network.output.output:options", serpent.block(options))
          return { }
        end,
        processerror = function(options)
          print("RuntimeMessages.network.output.processerror:options", serpent.block(options))
          return { }
        end,
        started = function(options)
          print("RuntimeMessages.network.output.started:options", serpent.block(options))
          return { }
        end,
        status = function(options)
          print("RuntimeMessages.network.output.status:options", serpent.block(options))
          return { }
        end,
        stop = function(options)
          print("RuntimeMessages.network.output.stop:options", serpent.block(options))
          return { }
        end
      }
    },
    runtime = {
      input = {
        getruntime = function(options)
          return {
            protocol = "runtime",
            command = "getruntime",
            payload = {
              secret = options.secret
            }
          }
        end,
        packet = function(options)
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
        end
      },
      output = {
        error = function(options)
          return {
            protocol = "runtime",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        packet = function(options)
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
        packetsent = function(options)
          return {
            protocol = "runtime",
            command = "packetsent",
            payload = { }
          }
        end,
        ports = function(options)
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
        runtime = function(options)
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
      input = {
        clear = function(options)
          print("RuntimeMessages.trace.input.clear:options", serpent.block(options))
          return { }
        end,
        dump = function(options)
          print("RuntimeMessages.trace.input.dump:options", serpent.block(options))
          return { }
        end,
        start = function(options)
          print("RuntimeMessages.trace.input.start:options", serpent.block(options))
          return { }
        end,
        stop = function(options)
          print("RuntimeMessages.trace.input.stop:options", serpent.block(options))
          return { }
        end
      },
      output = {
        clear = function(options)
          print("RuntimeMessages.trace.output.clear:options", serpent.block(options))
          return { }
        end,
        dump = function(options)
          print("RuntimeMessages.trace.output.dump:options", serpent.block(options))
          return { }
        end,
        error = function(options)
          return {
            protocol = "trace",
            command = "error",
            payload = {
              message = options.message
            }
          }
        end,
        start = function(options)
          print("RuntimeMessages.trace.output.start:options", serpent.block(options))
          return { }
        end,
        stop = function(options)
          print("RuntimeMessages.trace.output.stop:options", serpent.block(options))
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
