local http_headers = require("http.headers")
local http_server = require("http.server")
local http_websocket = require("http.websocket")
local json = require("dkjson")
local serpent = require("serpent")
local RuntimeMessages = require("RuntimeMessages")
local Network = require("Network")
local RUNTIME_ID = "keyboardcat"
local RUNTIME_LABEL = "LuaFlow"
local RUNTIME_VERSION = "0.1"
local RUNTIME_TYPE = "noflo"
local Runtime
do
  local _class_0
  local _base_0 = {
    log_request = function(self, stream, request_headers)
      local request_method = request_headers:get(":method")
      local date = os.date("%d/%b/%Y:%H:%M:%S %z")
      local method = request_method
      local path = (request_headers:get(":path")) or ""
      local version = stream.connection.version
      local referer = (request_headers:get("referer")) or "-"
      local user_agent = (request_headers:get("user-agent")) or "-"
      return print("[" .. tostring(date) .. "] \"" .. tostring(method) .. " " .. tostring(path) .. " HTTP/" .. tostring(version) .. "\" \"" .. tostring(referer) .. "\" \"" .. tostring(user_agent) .. "\"\n")
    end,
    log_command_in = function(self, protocol, command, payload)
      return print("--> " .. tostring(protocol) .. ":" .. tostring(command) .. " " .. tostring(serpent.line(payload)))
    end,
    log_command_out = function(self, result)
      local protocol, command, payload
      protocol, command, payload = result.protocol, result.command, result.payload
      return print("<-- " .. tostring(protocol) .. ":" .. tostring(command) .. " " .. tostring(serpent.line(payload)))
    end,
    handle_command = function(self, protocol, command, payload)
      command = "handle_" .. tostring(protocol) .. "_" .. tostring(command)
      local error_message = "Unsupported Protocol Command: " .. tostring(protocol) .. ":" .. tostring(command)
      local handler = assert(self[command], error_message)
      return handler(self, payload)
    end,
    handle_stream = function(self, stream)
      local request_headers = stream:get_headers()
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
        local obj, pos, err = json.decode(txt, 1, nil)
        if err then
          print("Error: " .. tostring(err))
        else
          local command, payload, protocol
          command, payload, protocol = obj.command, obj.payload, obj.protocol
          self:log_command_in(protocol, command, payload)
          local result = assert(self:handle_command(protocol, command, payload))
          self:log_command_out(result)
          ws:send((json.encode(result)), "text")
        end
        if txt == nil then
          break
        end
      end
      return ws:close()
    end,
    handle_stream_error = function(self, server, context, op, err, errno)
      local msg = tostring(op) .. " on " .. tostring(tostring(context)) .. " failed"
      if err then
        msg = tostring(msg) .. ": " .. tostring(tostring(err))
      end
      return print(tostring(msg) .. "\n")
    end,
    start = function(self)
      print("Runtime: Starting...")
      self.server:listen()
      print("Runtime: Listening on http://" .. tostring(self.host) .. ":" .. tostring(self.port))
      return self.server:loop()
    end,
    handle_runtime_getruntime = function(self, payload)
      return RuntimeMessages.runtime.output.Runtime({
        id = RUNTIME_ID,
        label = RUNTIME_LABEL,
        version = RUNTIME_VERSION,
        type = RUNTIME_TYPE,
        capabilities = {
          "graph:readonly",
          "network:control",
          "network:data",
          "network:persist",
          "network:status",
          "protocol:component",
          "protocol:graph",
          "protocol:network",
          "protocol:runtime"
        }
      })
    end,
    handle_graph_clear = function(self, payload)
      return RuntimeMessages.graph.output.Clear(self.network:ensure_graph({
        id = graph
      }):clear(payload))
    end,
    handle_graph_addedge = function(self, payload)
      local graph, metadata, src, tgt
      graph, metadata, src, tgt = payload.graph, payload.metadata, payload.src, payload.tgt
      return RuntimeMessages.graph.output.AddEdge(self.network:ensure_graph({
        id = graph
      }):addedge({
        src = src,
        tgt = tgt,
        metadata = metadata
      }))
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, options)
      self.host = options.host or "0.0.0.0"
      self.port = options.port or 3001
      self.server = http_server.listen({
        host = self.host,
        port = self.port,
        onstream = function(server, stream)
          return self:handle_stream(stream)
        end,
        onerror = self.handle_stream_error
      })
      self.network = Network()
    end,
    __base = _base_0,
    __name = "Runtime"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Runtime = _class_0
  return _class_0
end
