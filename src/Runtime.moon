http_headers = require "http.headers"
http_server = require "http.server"
http_websocket = require "http.websocket"
serpent = require "serpent"

JSON = require "JSON"
Network = require "Network"
RuntimeMessages = require "RuntimeMessages"

class Runtime
  new: (options) =>
    -- print "Runtime#new"

    @host = options.host or "0.0.0.0"
    @port = options.port or 3001

    @server = http_server.listen
      host: @host
      port: @port
      onstream: (server, stream) ->
        @handle_stream stream
      onerror: @handle_stream_error

    @network = Network!

    @log_commands = true
    if options.log_commands
      @log_commands = options.log_commands

    @log_command_contents = true
    if options.log_command_contents
      @log_command_contents = options.log_command_contents

  log_request: (stream, request_headers) =>
    -- print "Runtime#log_request"

    request_method = request_headers\get ":method"

    date = os.date "%d/%b/%Y:%H:%M:%S %z"
    method = request_method
    path = (request_headers\get ":path") or ""
    version = stream.connection.version
    referer = (request_headers\get "referer") or "-"
    user_agent = (request_headers\get "user-agent") or "-"

    print "[#{date}] \"#{method} #{path} HTTP/#{version}\" \"#{referer}\" \"#{user_agent}\"\n"

  log_command_in: (protocol, command, payload) =>
    return unless @log_commands

    output = "--> #{protocol}:#{command}"

    if @log_command_contents
      output = "#{output} #{serpent.line payload}"

    print output

  log_command_out: (result) =>
    return unless @log_commands

    import protocol, command, payload from result

    output = "<-- #{protocol}:#{command}"

    if @log_command_contents
      output = "#{output} #{serpent.line payload}"

    print output

  handle_stream: (stream) =>
    -- print "Runtime#handle_stream"

    request_headers = stream\get_headers!

    response_headers = http_headers.new!
    response_headers\append ":status", status
    response_headers\append "connection", "Upgrade"
    response_headers\append "upgrade", "websocket"
    response_headers\append "Sec-WebSocket-Protocol", "noflo"
    response_headers\append "Sec-WebSocket-Version", "13"

    ws = http_websocket.new_from_stream stream, request_headers
    ws\accept
      headers: response_headers

    for raw_input, raw_input_opcode in ws\each!
      input, pos, err = JSON\decode raw_input

      if err
        print "Error: #{err}"
        ws\close!
        break

      import command, payload, protocol from input

      @log_command_in protocol, command, payload

      handlers = assert self.handlers[protocol], "No handlers for protocol '#{protocol}'"
      handler = assert handlers[command], "No handler for command '#{command}'"
      output = assert (handler self, payload), "No output for command '#{protocol}:#{command}'"

      @log_command_out output

      raw_output = JSON\encode output

      ws\send raw_output, opcode

    ws\close!

  handle_stream_error: (server, context, op, err, errno) =>
    -- print "Runtime#handle_stream_error"

    msg = "#{op} on #{tostring context} failed"
    msg = "#{msg}: #{tostring err}" if err
    print "#{msg}\n"

  start: () =>
    -- print "Runtime#start"

    print "Runtime: Starting..."

    @server\listen!

    print "Runtime: Listening on http://#{@host}:#{@port}"

    @server\loop!

  handlers:
    component: {}

    runtime:
      getruntime: (payload) =>
        input_message = RuntimeMessages.runtime.input.getruntime payload

        output_message = RuntimeMessages.runtime.output.runtime
          id: "lua-flow"
          label: "LuaFlow"
          version: "0.1"
          type: "noflo"
          capabilities: {
            -- "component:getsource",
            -- "component:setsource",
            -- "graph:readonly",
            -- "network:control",
            -- "network:data",
            -- "network:persist",
            -- "network:status",
            -- "protocol:component",
            "protocol:graph",
            "protocol:network",
            "protocol:runtime",
            -- "protocol:trace",
          }

        output_message

    graph:
      addedge: (payload) =>
        input_message = RuntimeMessages.graph.input.addedge payload

        import graph, metadata, src, tgt from input_message.payload

        result = (@network\ensure_graph id: graph)\addedge
          graph: graph
          metadata: metadata
          src: src
          tgt: tgt

        output_message = RuntimeMessages.graph.output.addedge result
        output_message

      addnode: (payload) =>
        input_message = RuntimeMessages.graph.input.addnode payload

        import graph, id, node, metadata from input_message.payload

        result = (@network\ensure_graph id: graph)\addnode
          graph: graph
          id: id
          metadata: metadata
          node: node

        output_message = RuntimeMessages.graph.output.addnode result
        output_message

      changenode: (payload) =>
        input_message = RuntimeMessages.graph.input.changenode payload

        import graph, id, metadata from input_message.payload

        result = (@network\ensure_graph id: graph)\changenode
          graph: graph
          id: id
          metadata: metadata

        output_message = RuntimeMessages.graph.output.changenode result
        output_message

      clear: (payload) =>
        input_message = RuntimeMessages.graph.input.clear payload

        import id, graph from input_message.payload

        result = (@network\ensure_graph id: id)\clear
          id: id

        output_message = RuntimeMessages.graph.output.clear result

        output_message

    network: {}

    trace: {}
