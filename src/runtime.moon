host = "0.0.0.0"
port = arg[1] or 3001 -- or 0

print "Host: #{host}"
print "Port: #{port}"

http_headers = require "http.headers"
http_server = require "http.server"
http_websocket = require "http.websocket"
json = require "dkjson"
serpent = require "serpent"

log_request = (server, stream, request_headers) ->
  request_method = request_headers\get ":method"

  date = os.date "%d/%b/%Y:%H:%M:%S %z"
  method = request_method
  path = (request_headers\get ":path") or ""
  version = stream.connection.version
  referer = (request_headers\get "referer") or "-"
  user_agent = (request_headers\get "user-agent") or "-"

  print "[#{date}] \"#{method} #{path} HTTP/#{version}\" \"#{referer}\" \"#{user_agent}\"\n"

respond_with = (stream, status, headers, body) ->
  response_headers = http_headers.new!

  response_headers\append ":status", status
  -- response_headers\append "Content-Type", "text/plain"
  -- response_headers\append "Transfer-Encoding", "chunked"
  -- response_headers\append "Sec-WebSocket-Protocol", "noflo"

  for k, v in pairs headers
    response_headers\append k, v

  -- print "response_headers"
  -- for k, v in pairs response_headers
  --   print k, v

  stream\write_headers response_headers, false

  result, err, errno = stream\write_body_from_string body

  print errno, err if err

  stream\shutdown!

handle_request = (stream, request_headers) ->
  respond_with stream, "101", {}, ""

handle_runtime_command = (command, payload) ->
  print "handle_runtime_command #{command}"

handle_network_command = (command, payload) ->
  print "handle_network_command #{command}"

handle_graph_command = (command, payload) ->
  print "handle_graph_command #{command}"

handle_command = (protocol, command, payload) ->
  result = nil
  switch protocol
    when 'runtime'
      result = handle_runtime_command command, payload
    when 'network'
      result = handle_network_command command, payload
    when 'graph'
      result = handle_graph_command command, payload
    else
      print "Unsupported Protocol: #{protocol}"

  result

handle_upgrade_request = (stream, request_headers) ->
  sec_websocket_key = request_headers\get "Sec-WebSocket-Key"

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

      result = handle_command protocol, command, payload

      ws\send result, opcode

    if txt == nil
      break

  ws\close!

handle_stream = (server, stream) ->
  request_headers = stream\get_headers!
  request_method = request_headers\get ":method"
  request_connection = request_headers\get "connection"

  log_request server, stream, request_headers

  if request_connection == "Upgrade"
    handle_upgrade_request stream, request_headers
  else
    handle_request stream, request_headers

handle_error = (server, context, op, err, errno) ->
  msg = "#{op} on #{tostring context} failed"
  msg = "#{msg}: #{tostring err}" if err
  print "#{msg}\n"

server = http_server.listen
  host: host
  port: port
  onstream: handle_stream
  onerror: handle_error

print "Starting..."

server\listen!

print "Listening on http://#{host}:#{port}"

server\loop!
