local host = "0.0.0.0"
local port = arg[1] or 3001
print("Host: " .. tostring(host))
print("Port: " .. tostring(port))
local http_websocket = require("http.websocket")
local http_server = require("http.server")
local http_headers = require("http.headers")
local base64 = require('base64')
local get_websocket_accept
get_websocket_accept = function(key)
  return base64.encode(tostring(key) .. "KEYBOARDCAT")
end
local log_request
log_request = function(server, stream, request_headers)
  local request_method = request_headers:get(":method")
  return print(string.format('[%s] "%s %s HTTP/%g"  "%s" "%s"\n', os.date("%d/%b/%Y:%H:%M:%S %z"), request_method or "", (request_headers:get(":path")) or "", stream.connection.version, (request_headers:get("referer")) or "-", (request_headers:get("user-agent")) or "-"))
end
local respond_with
respond_with = function(stream, status, headers, body)
  local response_headers = http_headers.new()
  response_headers:append(":status", status)
  response_headers:append("Content-Type", "text/plain")
  response_headers:append("Transfer-Encoding", "chunked")
  response_headers:append("Sec-WebSocket-Protocol", "noflo")
  for k, v in pairs(headers) do
    response_headers:append(k, v)
  end
  print("response_headers")
  for k, v in pairs(response_headers) do
    print(k, v)
  end
  stream:write_headers(response_headers, false)
  local result, err, errno = stream:write_body_from_string(body)
  if err then
    print(errno, err)
  end
  return stream:shutdown()
end
local handle_request
handle_request = function(stream, request_headers)
  print("handle_request")
  return respond_with(stream, "101", { }, "")
end
local handle_upgrade_request
handle_upgrade_request = function(stream, request_headers)
  print("handle_upgrade_request")
  local sec_websocket_key = request_headers:get('Sec-WebSocket-Key')
  local ws = http_websocket.new_from_stream(stream, request_headers)
  ws:accept()
  local response_headers = {
    ['Sec-WebSocket-Accept'] = get_websocket_accept(sec_websocket_key),
    ['Sec-WebSocket-Protocol'] = 'noflo',
    ['Sec-WebSocket-Version'] = ''
  }
  return respond_with(stream, "101", response_headers, "")
end
local handle_stream
handle_stream = function(server, stream)
  print("handle_stream")
  local request_headers = stream:get_headers()
  local request_method = request_headers:get(":method")
  local request_connection = request_headers:get("connection")
  print("handle_stream:request_headers", request_headers)
  for k, v in pairs(request_headers) do
    print("handle_stream:request_headers:" .. tostring(k) .. "," .. tostring(v))
  end
  print("handle_stream:request_method", request_method)
  print("handle_stream:request_connection", request_connection)
  log_request(server, stream, request_headers)
  if request_connection == "Upgrade" then
    return handle_upgrade_request(stream, request_headers)
  else
    return handle_request(stream, request_headers)
  end
end
local handle_error
handle_error = function(server, context, op, err, errno)
  print("handle_error")
  local msg = tostring(op) .. " on " .. tostring(tostring(context)) .. " failed"
  if err then
    msg = tostring(msg) .. ": " .. tostring(tostring(err))
  end
  return print(tostring(msg) .. "\n")
end
local server = http_server.listen({
  host = host,
  port = port,
  onstream = handle_stream,
  onerror = handle_error
})
print("Starting...")
server:listen()
print("Listening on http://" .. tostring(host) .. ":" .. tostring(port))
return server:loop()
