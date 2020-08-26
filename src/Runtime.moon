http_headers = require "http.headers"
http_server = require "http.server"
http_websocket = require "http.websocket"
json = require "dkjson"
serpent = require "serpent"

RuntimeMessages = require "RuntimeMessages"
Network = require "Network"

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

    @log_command_contents = false
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
      input, pos, err = json.decode raw_input, 1, nil

      if err
        print "Error: #{err}"
        ws\close!
        break

      import command, payload, protocol from input

      @log_command_in protocol, command, payload

      output = assert (assert (assert self.handlers[protocol])[command]) self, payload

      @log_command_out output

      ws\send (json.encode output), opcode

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

    graph:
      addedge: (payload) =>
        -- print "Runtime#handlers.graph.addedge"

        input_message = RuntimeMessages.graph.input.addedge payload

        -- print "Runtime#handlers.graph.addedge:input_message", serpent.block input_message

        import graph, metadata, src, tgt from input_message.payload

        graph = @network\ensure_graph
          id: graph

        -- print "Runtime#handlers.graph.addedge:graph", graph

        result = graph\addedge
          src: src
          tgt: tgt
          metadata: metadata

        -- print "Runtime#handlers.graph.addedge:result", result

        output_message = RuntimeMessages.graph.output.addedge result

        -- print "Runtime#handlers.graph.addedge:output_message", output_message

        output_message

      changenode: (payload) =>
        print "Runtime#handlers.graph.changenode"

        input_message = RuntimeMessages.graph.input.changenode payload

        print "Runtime#handlers.graph.input_message", serpent.block input_message

        import graph, id, metadata from input_message.payload

        graph = @network\ensure_graph
          id: graph

        -- print "Runtime#handlers.graph.graph", graph

        result = graph\changenode
          id: id
          metadata: metadata

        print "Runtime#handlers.graph.result", serpent.block result

        output_message = RuntimeMessages.graph.output.changenode result

        print "Runtime#handlers.graph.output_message", serpent.block output_message

        output_message

      clear: (payload) =>
        -- print "Runtime#handlers.graph.clear"

        input_message = RuntimeMessages.graph.input.clear payload

        import id from input_message.payload

        -- print "Runtime#handlers.graph.clear:input_message", serpent.block input_message

        graph = @network\ensure_graph id: id

        -- print "Runtime#handlers.graph.clear:graph", graph

        result = graph\clear payload

        -- print "Runtime#handlers.graph.clear:result", result

        output_message = RuntimeMessages.graph.output.clear result

        -- print "Runtime#handlers.graph.clear:output_message", output_message

        output_message

    network: {}

    runtime:
      getruntime: (payload) =>
        -- print "Runtime#handlers.runtime.getruntime"

        input_message = RuntimeMessages.runtime.input.getruntime payload

        -- print "Runtime#handlers.runtime.getruntime:input_message", input_message

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

        -- print "Runtime#handlers.runtime.getruntime:output_message", output_message

        output_message

    trace: {}
