http_headers = require "http.headers"
http_server = require "http.server"
http_websocket = require "http.websocket"
json = require "dkjson"
serpent = require "serpent"

RuntimeMessages = require "RuntimeMessages"
Network = require "Network"

RUNTIME_ID = "keyboardcat"
RUNTIME_LABEL = "LuaFlow"
RUNTIME_VERSION = "0.1"
RUNTIME_TYPE = "noflo"

class Runtime
  new: (options) =>
    print "Runtime#new"

    @host = options.host or "0.0.0.0"
    @port = options.port or 3001

    @server = http_server.listen
      host: @host
      port: @port
      onstream: (server, stream) ->
        @handle_stream stream
      onerror: @handle_stream_error

    @network = Network!

  log_request: (stream, request_headers) =>
    print "Runtime#log_request"

    request_method = request_headers\get ":method"

    date = os.date "%d/%b/%Y:%H:%M:%S %z"
    method = request_method
    path = (request_headers\get ":path") or ""
    version = stream.connection.version
    referer = (request_headers\get "referer") or "-"
    user_agent = (request_headers\get "user-agent") or "-"

    print "[#{date}] \"#{method} #{path} HTTP/#{version}\" \"#{referer}\" \"#{user_agent}\"\n"

  log_command_in: (protocol, command, payload) =>
    print "--> #{protocol}:#{command} #{serpent.line payload}"

  log_command_out: (result) =>
    import protocol, command, payload from result
    print "<-- #{protocol}:#{command} #{serpent.line payload}"

  handle_command: (protocol, command, payload) =>
    print "Runtime#handle_command"

    command = "handle_#{protocol}_#{command}"
    error_message = "Unsupported Protocol Command: #{protocol}:#{command}"
    handler = assert self[command], error_message
    handler self, payload

  handle_stream: (stream) =>
    print "Runtime#handle_stream"

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

    while true
      txt, opcode = ws\receive!

      obj, pos, err = json.decode txt, 1, nil

      if err
        print "Error: #{err}"
      else
        import command, payload, protocol from obj

        @log_command_in protocol, command, payload

        result = assert @handle_command protocol, command, payload

        -- print "Runtime#handle_stream:result", serpent.block result

        @log_command_out result

        ws\send (json.encode result), "text"

      if txt == nil
        break

    ws\close!

  handle_stream_error: (server, context, op, err, errno) =>
    print "Runtime#handle_stream_error"

    msg = "#{op} on #{tostring context} failed"
    msg = "#{msg}: #{tostring err}" if err
    print "#{msg}\n"

  start: () =>
    print "Runtime#start"

    print "Runtime: Starting..."

    @server\listen!

    print "Runtime: Listening on http://#{@host}:#{@port}"

    @server\loop!

  handle_runtime_getruntime: (payload) =>
    print "Runtime#handle_runtime_getruntime"

    RuntimeMessages.runtime.output.Runtime
      id: RUNTIME_ID
      label: RUNTIME_LABEL
      version: RUNTIME_VERSION
      type: RUNTIME_TYPE
      capabilities: {
        -- "component:getsource",
        -- "component:setsource",
        "graph:readonly",
        "network:control",
        "network:data",
        "network:persist",
        "network:status",
        "protocol:component",
        "protocol:graph",
        "protocol:network",
        "protocol:runtime",
        -- "protocol:trace",
      }

  handle_graph_clear: (payload) =>
    print "Runtime#handle_graph_clear"

    import id from payload

    graph = @network\ensure_graph
      id: id

    result = graph\clear payload

    RuntimeMessages.graph.output.Clear result

  handle_graph_addedge: (payload) =>
    print "Runtime#handle_graph_addedge"

    import graph, metadata, src, tgt from payload

    graph = @network\ensure_graph
      id: graph

    result = graph\addedge
      src: src
      tgt: tgt
      metadata: metadata

    RuntimeMessages.graph.output.AddEdge result

  handle_graph_changenode: (payload) =>
    print "Runtime#handle_graph_changenode"
    print "Runtime#handle_graph_changenode:payload", serpent.block payload

    import graph, id, metadata from payload

    graph = @network\ensure_graph
      id: graph

    result = graph\changenode
      id: id
      metadata: metadata

    RuntimeMessages.graph.output.ChangeNode result
