host = "0.0.0.0"
port = arg[1] or 3001 -- or 0

print "Host: #{host}"
print "Port: #{port}"

http_websocket = require "http.websocket"
http_server = require "http.server"
http_headers = require "http.headers"
base64 = require 'base64'

get_websocket_accept = (key) ->
  base64.encode "#{key}KEYBOARDCAT"

log_request = (server, stream, request_headers) ->
  request_method = request_headers\get ":method"

  print string.format '[%s] "%s %s HTTP/%g"  "%s" "%s"\n',
    os.date "%d/%b/%Y:%H:%M:%S %z",
    request_method or "",
    (request_headers\get ":path") or "",
    stream.connection.version,
    (request_headers\get "referer") or "-",
    (request_headers\get "user-agent") or "-"

respond_with = (stream, status, headers, body) ->
  response_headers = http_headers.new!

  response_headers\append ":status", status
  response_headers\append "Content-Type", "text/plain"
  response_headers\append "Transfer-Encoding", "chunked"
  response_headers\append "Sec-WebSocket-Protocol", "noflo"
  response_headers\append k, v for k, v in pairs headers

  print "response_headers"
  for k, v in pairs response_headers
    print k, v

  stream\write_headers response_headers, false

  result, err, errno = stream\write_body_from_string body

  print errno, err if err

  stream\shutdown!

handle_request = (stream, request_headers) ->
  print "handle_request"

  respond_with stream, "101", {}, ""

handle_upgrade_request = (stream, request_headers) ->
  print "handle_upgrade_request"

  sec_websocket_key = request_headers\get 'Sec-WebSocket-Key'

  ws = http_websocket.new_from_stream stream, request_headers

  ws\accept!

  response_headers =
    'Sec-WebSocket-Accept': get_websocket_accept sec_websocket_key
    'Sec-WebSocket-Protocol': 'noflo'
    'Sec-WebSocket-Version': ''

  respond_with stream, "101", response_headers, ""

handle_stream = (server, stream) ->
  print "handle_stream"

  request_headers = stream\get_headers!
  request_method = request_headers\get ":method"
  request_connection = request_headers\get "connection"

  print "handle_stream:request_headers", request_headers
  for k, v in pairs request_headers
    print "handle_stream:request_headers:#{k},#{v}"

  print "handle_stream:request_method", request_method
  print "handle_stream:request_connection", request_connection

  log_request server, stream, request_headers

  if request_connection == "Upgrade"
    handle_upgrade_request stream, request_headers
  else
    handle_request stream, request_headers

handle_error = (server, context, op, err, errno) ->
  print "handle_error"

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
