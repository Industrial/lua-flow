local host = "0.0.0.0"
local port = arg[1] or 3001
print("Host: " .. tostring(host))
print("Port: " .. tostring(port))
local serpent = require("serpent")
local http_websocket = require("http.websocket")
local http_server = require("http.server")
local http_headers = require("http.headers")
local log_request
log_request = function(server, stream, request_headers)
  local request_method = request_headers:get(":method")
  local date = os.date("%d/%b/%Y:%H:%M:%S %z")
  local method = request_method
  local path = (request_headers:get(":path")) or ""
  local version = stream.connection.version
  local referer = (request_headers:get("referer")) or "-"
  local user_agent = (request_headers:get("user-agent")) or "-"
  return print("[" .. tostring(date) .. "] \"" .. tostring(method) .. " " .. tostring(path) .. " HTTP/" .. tostring(version) .. "\" \"" .. tostring(referer) .. "\" \"" .. tostring(user_agent) .. "\"\n")
end
local respond_with
respond_with = function(stream, status, headers, body)
  local response_headers = http_headers.new()
  response_headers:append(":status", status)
  for k, v in pairs(headers) do
    response_headers:append(k, v)
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
  local sec_websocket_key = request_headers:get("Sec-WebSocket-Key")
  local response_headers = http_headers.new()
  response_headers:append(":status", status)
  response_headers:append("connection", "Upgrade")
  response_headers:append("upgrade", "websocket")
  response_headers:append("Sec-WebSocket-Protocol", "noflo")
  response_headers:append("Sec-WebSocket-Version", "13")
  local ws = http_websocket.new_from_stream(stream, request_headers)
  ws:accept({
    headers = response_headers
  })
  while true do
    local txt, opcode = ws:receive()
    if txt == nil then
      break
    end
    ws:send(txt, opcode)
  end
  return ws:close()
end
local handle_stream
handle_stream = function(server, stream)
  print("handle_stream")
  local request_headers = stream:get_headers()
  local request_method = request_headers:get(":method")
  local request_connection = request_headers:get("connection")
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
