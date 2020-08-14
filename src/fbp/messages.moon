messages =
  component:
    input:
      GetSource: (options) ->
        protocol: "component"
        command: "getsource"
        payload:
          name: options.name

      List: (options) ->
        protocol: "component"
        command: "list"
        payload: {}

      Source: (options) ->
        protocol: "component"
        command: "source"
        payload:
          name: options.name
          language: options.language
          library: options.library
          code: options.code
          tests: options.tests

    output:
      Component: (options) ->
        protocol: "component"
        command: "component"
        payload:
          name: options.name
          description: options.description
          icon: options.icon
          subgraph: options.subgraph
          inPorts: options.inPorts
          outPorts: options.outPorts

      ComponentsReady: (options) ->
        protocol: "component"
        command: "componentsready"
        payload: options.count

      Error: (options) ->
        protocol: "component"
        command: "error"
        payload:
          message: options.message

      Source: (options) ->
        protocol: "component"
        command: "source"
        payload:
          name: options.name
          language: options.language
          library: options.library
          code: options.code
          tests: options.tests

  graph:
    input:
      AddEdge: (options) ->

      AddGroup: (options) ->

      AddInitial: (options) ->

      AddInPort: (options) ->

      AddNode: (options) ->

      AddOutPort: (options) ->

      ChangeEdge: (options) ->

      ChangeGroup: (options) ->

      ChangeNode: (options) ->

      Clear: (options) ->

      Error: (options) ->
        protocol: "graph"
        command: "error"
        payload:
          message: options.message

      RemoveEdge: (options) ->

      RemoveGroup: (options) ->

      RemoveInitial: (options) ->

      RemoveInPort: (options) ->

      RemoveNode: (options) ->

      RemoveOutPort: (options) ->

      RenameGroup: (options) ->

      RenameInPort: (options) ->

      RenameNode: (options) ->

      RenameOutPort: (options) ->

    output:
      AddEdge: (options) ->

      AddGroup: (options) ->

      AddInitial: (options) ->

      AddInPort: (options) ->

      AddNode: (options) ->

      AddOutPort: (options) ->

      ChangeEdge: (options) ->

      ChangeGroup: (options) ->

      ChangeNode: (options) ->

      Clear: (options) ->

      Error: (options) ->
        protocol: "graph"
        command: "error"
        payload:
          message: options.message

      RemoveEdge: (options) ->

      RemoveGroup: (options) ->

      RemoveInitial: (options) ->

      RemoveInPort: (options) ->

      RemoveNode: (options) ->

      RemoveOutPort: (options) ->

      RenameGroup: (options) ->

      RenameInPort: (options) ->

      RenameNode: (options) ->

      RenameOutPort: (options) ->

  network:
    input:
      Debug: (options) ->

      Edges: (options) ->

      GetStatus: (options) ->

      Persist: (options) ->

      Start: (options) ->

      Stop: (options) ->

    output:
      BeginGroup: (options) ->

      Connect: (options) ->

      Data: (options) ->

      Disconnect: (options) ->

      Edges: (options) ->

      EndGroup: (options) ->

      Error: (options) ->
        protocol: "network"
        command: "error"
        payload:
          message: options.message

      Icon: (options) ->

      Output: (options) ->

      ProcessError: (options) ->

      Started: (options) ->

      Status: (options) ->

      Stop: (options) ->

  runtime:
    input:
      GetRuntime: (options) ->
        protocol: "runtime"
        command: "getruntime"
        payload:
          secret: options.secret

      Packet: (options) ->
        protocol: "runtime"
        command: "packet"
        payload:
          port: options.port
          event: options.event
          type: options.type
          schema: options.schema
          payload: options.payload
          graph: options.graph

    output:
      Error: (options) ->
        protocol: "runtime"
        command: "error"
        payload:
          message: options.message

      Packet: (options) ->
        protocol: "runtime"
        command: "packet"
        payload:
          port: options.port
          event: options.event
          type: options.type
          schema: options.schema
          payload: options.payload
          graph: options.graph

      PacketSent: (options) ->
        protocol: "runtime"
        command: "packetsent"
        payload:

      Ports: (options) ->
        protocol: "runtime"
        command: "ports"
        payload:
          inPorts: options.inPorts
          outPorts: options.outPorts
          graph: options.graph

      Runtime: (options) ->
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
          reposutoryVersion: options.reposutoryVersion

  trace:
    input:
      Clear: (options) ->

      Dump: (options) ->

      Start: (options) ->

      Stop: (options) ->

    output:
      Clear: (options) ->

      Dump: (options) ->

      Error: (options) ->
        protocol: "trace"
        command: "error"
        payload:
          message: options.message

      Start: (options) ->

      Stop: (options) ->