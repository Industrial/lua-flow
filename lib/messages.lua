local messages = {
  component = {
    input = {
      GetSource = function(options)
        local _ = {
          protocol = "component"
        }
        _ = {
          command = "getsource"
        }
        return {
          payload = {
            name = options.name
          }
        }
      end,
      List = function(options)
        local _ = {
          protocol = "component"
        }
        _ = {
          command = "list"
        }
        return {
          payload = { }
        }
      end,
      Source = function(options)
        local _ = {
          protocol = "component"
        }
        _ = {
          command = "source"
        }
        return {
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
      Component = function(options)
        local _ = {
          protocol = "component"
        }
        _ = {
          command = "component"
        }
        return {
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
        local _ = {
          protocol = "component"
        }
        _ = {
          command = "componentsready"
        }
        return {
          payload = options.count
        }
      end,
      Error = function(options)
        local _ = {
          protocol = "component"
        }
        _ = {
          command = "error"
        }
        return {
          payload = {
            message = options.message
          }
        }
      end,
      Source = function(options)
        local _ = {
          protocol = "component"
        }
        _ = {
          command = "source"
        }
        return {
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
      AddEdge = function(options) end,
      AddGroup = function(options) end,
      AddInitial = function(options) end,
      AddInPort = function(options) end,
      AddNode = function(options) end,
      AddOutPort = function(options) end,
      ChangeEdge = function(options) end,
      ChangeGroup = function(options) end,
      ChangeNode = function(options) end,
      Clear = function(options) end,
      Error = function(options)
        local _ = {
          protocol = "graph"
        }
        _ = {
          command = "error"
        }
        return {
          payload = {
            message = options.message
          }
        }
      end,
      RemoveEdge = function(options) end,
      RemoveGroup = function(options) end,
      RemoveInitial = function(options) end,
      RemoveInPort = function(options) end,
      RemoveNode = function(options) end,
      RemoveOutPort = function(options) end,
      RenameGroup = function(options) end,
      RenameInPort = function(options) end,
      RenameNode = function(options) end,
      RenameOutPort = function(options) end
    },
    output = {
      AddEdge = function(options) end,
      AddGroup = function(options) end,
      AddInitial = function(options) end,
      AddInPort = function(options) end,
      AddNode = function(options) end,
      AddOutPort = function(options) end,
      ChangeEdge = function(options) end,
      ChangeGroup = function(options) end,
      ChangeNode = function(options) end,
      Clear = function(options) end,
      Error = function(options)
        local _ = {
          protocol = "graph"
        }
        _ = {
          command = "error"
        }
        return {
          payload = {
            message = options.message
          }
        }
      end,
      RemoveEdge = function(options) end,
      RemoveGroup = function(options) end,
      RemoveInitial = function(options) end,
      RemoveInPort = function(options) end,
      RemoveNode = function(options) end,
      RemoveOutPort = function(options) end,
      RenameGroup = function(options) end,
      RenameInPort = function(options) end,
      RenameNode = function(options) end,
      RenameOutPort = function(options) end
    }
  },
  network = {
    input = {
      Debug = function(options) end,
      Edges = function(options) end,
      GetStatus = function(options) end,
      Persist = function(options) end,
      Start = function(options) end,
      Stop = function(options) end
    },
    output = {
      BeginGroup = function(options) end,
      Connect = function(options) end,
      Data = function(options) end,
      Disconnect = function(options) end,
      Edges = function(options) end,
      EndGroup = function(options) end,
      Error = function(options)
        local _ = {
          protocol = "network"
        }
        _ = {
          command = "error"
        }
        return {
          payload = {
            message = options.message
          }
        }
      end,
      Icon = function(options) end,
      Output = function(options) end,
      ProcessError = function(options) end,
      Started = function(options) end,
      Status = function(options) end,
      Stop = function(options) end
    }
  },
  runtime = {
    input = {
      GetRuntime = function(options)
        local _ = {
          protocol = "runtime"
        }
        _ = {
          command = "getruntime"
        }
        return {
          payload = {
            secret = options.secret
          }
        }
      end,
      Packet = function(options)
        local _ = {
          protocol = "runtime"
        }
        _ = {
          command = "packet"
        }
        return {
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
      Error = function(options)
        local _ = {
          protocol = "runtime"
        }
        _ = {
          command = "error"
        }
        return {
          payload = {
            message = options.message
          }
        }
      end,
      Packet = function(options)
        local _ = {
          protocol = "runtime"
        }
        _ = {
          command = "packet"
        }
        return {
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
        local _ = {
          protocol = "runtime"
        }
        _ = {
          command = "packetsent"
        }
        _ = {
          payload = {
            Ports = function(options) end
          }
        }
        _ = {
          protocol = "runtime"
        }
        _ = {
          command = "ports"
        }
        return {
          payload = {
            inPorts = options.inPorts,
            outPorts = options.outPorts,
            graph = options.graph
          }
        }
      end,
      Runtime = function(options)
        local _ = {
          protocol = "runtime"
        }
        _ = {
          command = "runtime"
        }
        return {
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
            reposutoryVersion = options.reposutoryVersion
          }
        }
      end
    }
  },
  trace = {
    input = {
      Clear = function(options) end,
      Dump = function(options) end,
      Start = function(options) end,
      Stop = function(options) end
    },
    output = {
      Clear = function(options) end,
      Dump = function(options) end,
      Error = function(options)
        local _ = {
          protocol = "trace"
        }
        _ = {
          command = "error"
        }
        return {
          payload = {
            message = options.message
          }
        }
      end,
      Start = function(options) end,
      Stop = function(options) end
    }
  }
}
