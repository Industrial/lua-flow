serpent = require "serpent"

class RuntimeMessages
  component:
    input:
      getsource: (options) ->
        -- print "RuntimeMessages.component.input.getsource:options", serpent.block options
        {
          protocol: "component"
          command: "getsource"
          payload:
            name: options.name
        }

      list: (options) ->
        -- print "RuntimeMessages.component.input.list:options", serpent.block options
        {
          protocol: "component"
          command: "list"
          payload: {}
        }

      source: (options) ->
        -- print "RuntimeMessages.component.input.source:options", serpent.block options
        {
          protocol: "component"
          command: "source"
          payload:
            name: options.name
            language: options.language
            library: options.library
            code: options.code
            tests: options.tests
        }

    output:
      component: (options) ->
        -- print "RuntimeMessages.component.output.component:options", serpent.block options
        {
          protocol: "component"
          command: "component"
          payload:
            name: options.name
            description: options.description
            icon: options.icon
            subgraph: options.subgraph
            inPorts: options.inPorts
            outPorts: options.outPorts
        }

      componentsready: (options) ->
        -- print "RuntimeMessages.component.output.componentsready:options", serpent.block options
        {
          protocol: "component"
          command: "componentsready"
          payload: options.count
        }

      error: (options) ->
        -- print "RuntimeMessages.component.output.error:options", serpent.block options
        {
          protocol: "component"
          command: "error"
          payload:
            message: options.message
        }

      source: (options) ->
        -- print "RuntimeMessages.component.output.source:options", serpent.block options
        {
          protocol: "component"
          command: "source"
          payload:
            name: options.name
            language: options.language
            library: options.library
            code: options.code
            tests: options.tests
        }

  graph:
    input:
      addedge: (options) ->
        -- print "RuntimeMessages.graph.input.addedge:options", serpent.block options
        {
          protocol: "graph"
          command: "addedge"
          payload:
            graph: options.graph
            metadata: options.metadata
            src:
              node: options.src.node
              port: options.src.port
            tgt:
              node: options.tgt.node
              port: options.tgt.port
        }

      addgroup: (options) ->
        print "RuntimeMessages.graph.input.addgroup:options", serpent.block options
        {}

      addinitial: (options) ->
        print "RuntimeMessages.graph.input.addinitial:options", serpent.block options
        {}

      addinport: (options) ->
        print "RuntimeMessages.graph.input.addinport:options", serpent.block options
        {}

      addnode: (options) ->
        -- print "RuntimeMessages.graph.input.addnode:options", serpent.block options
        {
          protocol: "graph"
          command: "addnode"
          payload:
            node: options.component
            graph: options.graph
            id: options.id
            metadata: options.metadata
        }

      addoutport: (options) ->
        print "RuntimeMessages.graph.input.addoutport:options", serpent.block options
        {}

      changeedge: (options) ->
        print "RuntimeMessages.graph.input.changeedge:options", serpent.block options
        {}

      changegroup: (options) ->
        print "RuntimeMessages.graph.input.changegroup:options", serpent.block options
        {}

      changenode: (options) ->
        -- print "RuntimeMessages.graph.input.changenode:options", serpent.block options
        {
          protocol: "graph"
          command: "changenode"
          payload:
            graph: options.graph
            id: options.id
            metadata: options.metadata
        }

      clear: (options) ->
        -- print "RuntimeMessages.graph.input.clear:options", serpent.block options
        {
          protocol: "graph"
          command: "clear"
          payload:
            id: options.id
            main: options.main
        }

      error: (options) ->
        -- print "RuntimeMessages.graph.input.error:options", serpent.block options
        {
          protocol: "graph"
          command: "error"
          payload:
            message: options.message
        }

      removeedge: (options) ->
        print "RuntimeMessages.graph.input.removeedge:options", serpent.block options
        {}

      removegroup: (options) ->
        print "RuntimeMessages.graph.input.removegroup:options", serpent.block options
        {}

      removeinitial: (options) ->
        print "RuntimeMessages.graph.input.removeinitial:options", serpent.block options
        {}

      removeinport: (options) ->
        print "RuntimeMessages.graph.input.removeinport:options", serpent.block options
        {}

      removenode: (options) ->
        print "RuntimeMessages.graph.input.removenode:options", serpent.block options
        {}

      removeoutport: (options) ->
        print "RuntimeMessages.graph.input.removeoutport:options", serpent.block options
        {}

      renamegroup: (options) ->
        print "RuntimeMessages.graph.input.renamegroup:options", serpent.block options
        {}

      renameinport: (options) ->
        print "RuntimeMessages.graph.input.renameinport:options", serpent.block options
        {}

      renamenode: (options) ->
        print "RuntimeMessages.graph.input.renamenode:options", serpent.block options
        {}

      renameoutport: (options) ->
        print "RuntimeMessages.graph.input.renameoutport:options", serpent.block options
        {}

    output:
      addedge: (options) ->
        -- print "RuntimeMessages.graph.output.addedge:options", serpent.block options
        {
          protocol: "graph"
          command: "addedge"
          payload:
            src: options.src
            tgt: options.tgt
            metadata: options.metadata
            graph: options.graph
        }

      addgroup: (options) ->
        print "RuntimeMessages.graph.output.addgroup:options", serpent.block options
        {}

      addinitial: (options) ->
        print "RuntimeMessages.graph.output.addinitial:options", serpent.block options
        {}

      addinport: (options) ->
        print "RuntimeMessages.graph.output.addinport:options", serpent.block options
        {}

      addnode: (options) ->
        -- print "RuntimeMessages.graph.output.addnode:options", serpent.block options
        {
          protocol: "graph"
          command: "addnode"
          payload:
            component: options.node
            graph: options.graph
            id: options.id
            metadata: options.metadata
        }

      addoutport: (options) ->
        print "RuntimeMessages.graph.output.addoutport:options", serpent.block options
        {}

      changeedge: (options) ->
        print "RuntimeMessages.graph.output.changeedge:options", serpent.block options
        {}

      changegroup: (options) ->
        print "RuntimeMessages.graph.output.changegroup:options", serpent.block options
        {}

      changenode: (options) ->
        -- print "RuntimeMessages.graph.output.changenode:options", serpent.block options
        {
          protocol: "graph"
          command: "changenode"
          payload:
            graph: options.graph
            id: options.id
            metadata: options.metadata
        }

      clear: (options) ->
        -- print "RuntimeMessages.graph.output.clear:options", serpent.block options
        {
          protocol: "graph"
          command: "clear"
          payload:
            id: options.id
            main: options.main
        }

      error: (options) ->
        -- print "RuntimeMessages.graph.output.error:options", serpent.block options
        {
          protocol: "graph"
          command: "error"
          payload:
            message: options.message
        }

      removeedge: (options) ->
        print "RuntimeMessages.graph.output.removeedge:options", serpent.block options
        {}

      removegroup: (options) ->
        print "RuntimeMessages.graph.output.removegroup:options", serpent.block options
        {}

      removeinitial: (options) ->
        print "RuntimeMessages.graph.output.removeinitial:options", serpent.block options
        {}

      removeinport: (options) ->
        print "RuntimeMessages.graph.output.removeinport:options", serpent.block options
        {}

      removenode: (options) ->
        print "RuntimeMessages.graph.output.removenode:options", serpent.block options
        {}

      removeoutport: (options) ->
        print "RuntimeMessages.graph.output.removeoutport:options", serpent.block options
        {}

      renamegroup: (options) ->
        print "RuntimeMessages.graph.output.renamegroup:options", serpent.block options
        {}

      renameinport: (options) ->
        print "RuntimeMessages.graph.output.renameinport:options", serpent.block options
        {}

      renamenode: (options) ->
        print "RuntimeMessages.graph.output.renamenode:options", serpent.block options
        {}

      renameoutport: (options) ->
        print "RuntimeMessages.graph.output.renameoutport:options", serpent.block options
        {}

  network:
    input:
      debug: (options) ->
        print "RuntimeMessages.network.input.debug:options", serpent.block options
        {}

      edges: (options) ->
        print "RuntimeMessages.network.input.edges:options", serpent.block options
        {}

      getstatus: (options) ->
        print "RuntimeMessages.network.input.getstatus:options", serpent.block options
        {}

      persist: (options) ->
        print "RuntimeMessages.network.input.persist:options", serpent.block options
        {}

      start: (options) ->
        print "RuntimeMessages.network.input.start:options", serpent.block options
        {}

      stop: (options) ->
        print "RuntimeMessages.network.input.stop:options", serpent.block options
        {}

    output:
      begingroup: (options) ->
        print "RuntimeMessages.network.output.begingroup:options", serpent.block options
        {}

      connect: (options) ->
        print "RuntimeMessages.network.output.connect:options", serpent.block options
        {}

      data: (options) ->
        print "RuntimeMessages.network.output.data:options", serpent.block options
        {}

      disconnect: (options) ->
        print "RuntimeMessages.network.output.disconnect:options", serpent.block options
        {}

      edges: (options) ->
        print "RuntimeMessages.network.output.edges:options", serpent.block options
        {}

      endgroup: (options) ->
        print "RuntimeMessages.network.output.endgroup:options", serpent.block options
        {}

      error: (options) ->
        -- print "RuntimeMessages.network.output.error:options", serpent.block options
        {
          protocol: "network"
          command: "error"
          payload:
            message: options.message
        }

      icon: (options) ->
        print "RuntimeMessages.network.output.icon:options", serpent.block options
        {}

      output: (options) ->
        print "RuntimeMessages.network.output.output:options", serpent.block options
        {}

      processerror: (options) ->
        print "RuntimeMessages.network.output.processerror:options", serpent.block options
        {}

      started: (options) ->
        print "RuntimeMessages.network.output.started:options", serpent.block options
        {}

      status: (options) ->
        print "RuntimeMessages.network.output.status:options", serpent.block options
        {}

      stop: (options) ->
        print "RuntimeMessages.network.output.stop:options", serpent.block options
        {}

  runtime:
    input:
      getruntime: (options) ->
        -- print "RuntimeMessages.runtime.input.getruntime:options", serpent.block options
        {
          protocol: "runtime"
          command: "getruntime"
          payload:
            secret: options.secret
        }

      packet: (options) ->
        -- print "RuntimeMessages.runtime.input.packet:options", serpent.block options
        {
          protocol: "runtime"
          command: "packet"
          payload:
            port: options.port
            event: options.event
            type: options.type
            schema: options.schema
            payload: options.payload
            graph: options.graph
        }

    output:
      error: (options) ->
        -- print "RuntimeMessages.runtime.output.error:options", serpent.block options
        {
          protocol: "runtime"
          command: "error"
          payload:
            message: options.message
        }

      packet: (options) ->
        -- print "RuntimeMessages.runtime.output.packet:options", serpent.block options
        {
          protocol: "runtime"
          command: "packet"
          payload:
            port: options.port
            event: options.event
            type: options.type
            schema: options.schema
            payload: options.payload
            graph: options.graph
        }

      packetsent: (options) ->
        -- print "RuntimeMessages.runtime.output.packetsent:options", serpent.block options
        {
          protocol: "runtime"
          command: "packetsent"
          payload: {}
        }

      ports: (options) ->
        -- print "RuntimeMessages.runtime.output.ports:options", serpent.block options
        {
          protocol: "runtime"
          command: "ports"
          payload:
            inPorts: options.inPorts
            outPorts: options.outPorts
            graph: options.graph
        }

      runtime: (options) ->
        -- print "RuntimeMessages.runtime.output.runtime:options", serpent.block options
        {
          protocol: "runtime"
          command: "runtime"
          payload:
            id: options.id
            label: options.label
            version: options.version
            allCapabilities: options.allCapabilities
            capabilities: options.capabilities
            graph: options.graph
            type: options.type
            namespace: options.namespace
            repository: options.repository
            repositoryVersion: options.reposutoryVersion
        }

  trace:
    input:
      clear: (options) ->
        print "RuntimeMessages.trace.input.clear:options", serpent.block options
        {}

      dump: (options) ->
        print "RuntimeMessages.trace.input.dump:options", serpent.block options
        {}

      start: (options) ->
        print "RuntimeMessages.trace.input.start:options", serpent.block options
        {}

      stop: (options) ->
        print "RuntimeMessages.trace.input.stop:options", serpent.block options
        {}

    output:
      clear: (options) ->
        print "RuntimeMessages.trace.output.clear:options", serpent.block options
        {}

      dump: (options) ->
        print "RuntimeMessages.trace.output.dump:options", serpent.block options
        {}

      error: (options) ->
        -- print "RuntimeMessages.trace.output.error:options", serpent.block options
        {
          protocol: "trace"
          command: "error"
          payload:
            message: options.message
        }

      start: (options) ->
        print "RuntimeMessages.trace.output.start:options", serpent.block options
        {}

      stop: (options) ->
        print "RuntimeMessages.trace.output.stop:options", serpent.block options
        {}
