local http_headers = require("http.headers")
local http_server = require("http.server")
local http_websocket = require("http.websocket")
local serpent = require("serpent")
local JSON = require("JSON")
local Network = require("Network")
local RuntimeMessages = require("RuntimeMessages")
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
      if not (self.log_commands) then
        return 
      end
      local output = "--> " .. tostring(protocol) .. ":" .. tostring(command)
      if self.log_command_contents then
        output = tostring(output) .. " " .. tostring(serpent.line(payload))
      end
      return print(output)
    end,
    log_command_out = function(self, result)
      if not (self.log_commands) then
        return 
      end
      local protocol, command, payload
      protocol, command, payload = result.protocol, result.command, result.payload
      local output = "<-- " .. tostring(protocol) .. ":" .. tostring(command)
      if self.log_command_contents then
        output = tostring(output) .. " " .. tostring(serpent.line(payload))
      end
      return print(output)
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
      for raw_input, raw_input_opcode in ws:each() do
        local input, pos, err = JSON:decode(raw_input)
        if err then
          print("Error: " .. tostring(err))
          ws:close()
          break
        end
        local command, payload, protocol
        command, payload, protocol = input.command, input.payload, input.protocol
        self:log_command_in(protocol, command, payload)
        local handlers = assert(self.handlers[protocol], "No handlers for protocol '" .. tostring(protocol) .. "'")
        local handler = assert(handlers[command], "No handler for command '" .. tostring(command) .. "'")
        local output = assert((handler(self, payload)), "No output for command '" .. tostring(protocol) .. ":" .. tostring(command) .. "'")
        self:log_command_out(output)
        local raw_output = JSON:encode(output)
        ws:send(raw_output, opcode)
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
    handlers = {
      component = { },
      runtime = {
        getruntime = function(self, payload)
          local input_message = RuntimeMessages.runtime.input.getruntime(payload)
          local output_message = RuntimeMessages.runtime.output.runtime({
            id = "lua-flow",
            label = "LuaFlow",
            version = "0.1",
            type = "noflo",
            capabilities = {
              "protocol:graph",
              "protocol:network",
              "protocol:runtime"
            }
          })
          return output_message
        end
      },
      graph = {
        addedge = function(self, payload)
          local input_message = RuntimeMessages.graph.input.addedge(payload)
          local graph, metadata, src, tgt
          do
            local _obj_0 = input_message.payload
            graph, metadata, src, tgt = _obj_0.graph, _obj_0.metadata, _obj_0.src, _obj_0.tgt
          end
          local result = (self.network:ensure_graph({
            id = graph
          })):addedge({
            graph = graph,
            metadata = metadata,
            src = src,
            tgt = tgt
          })
          local output_message = RuntimeMessages.graph.output.addedge(result)
          return output_message
        end,
        addinitial = function(self, payload)
          local input_message = RuntimeMessages.graph.input.addinitial(payload)
          local graph, metadata, src, tgt
          do
            local _obj_0 = input_message.payload
            graph, metadata, src, tgt = _obj_0.graph, _obj_0.metadata, _obj_0.src, _obj_0.tgt
          end
          local result = (self.network:ensure_graph({
            id = graph
          })):addinitial({
            graph = graph,
            metadata = metadata,
            src = src,
            tgt = tgt
          })
          local output_message = RuntimeMessages.graph.output.addinitial(result)
          return output_message
        end,
        addnode = function(self, payload)
          local input_message = RuntimeMessages.graph.input.addnode(payload)
          local graph, id, node, metadata
          do
            local _obj_0 = input_message.payload
            graph, id, node, metadata = _obj_0.graph, _obj_0.id, _obj_0.node, _obj_0.metadata
          end
          local result = (self.network:ensure_graph({
            id = graph
          })):addnode({
            graph = graph,
            id = id,
            metadata = metadata,
            node = node
          })
          local output_message = RuntimeMessages.graph.output.addnode(result)
          return output_message
        end,
        changenode = function(self, payload)
          local input_message = RuntimeMessages.graph.input.changenode(payload)
          local graph, id, metadata
          do
            local _obj_0 = input_message.payload
            graph, id, metadata = _obj_0.graph, _obj_0.id, _obj_0.metadata
          end
          local result = (self.network:ensure_graph({
            id = graph
          })):changenode({
            graph = graph,
            id = id,
            metadata = metadata
          })
          local output_message = RuntimeMessages.graph.output.changenode(result)
          return output_message
        end,
        clear = function(self, payload)
          local input_message = RuntimeMessages.graph.input.clear(payload)
          local id, graph
          do
            local _obj_0 = input_message.payload
            id, graph = _obj_0.id, _obj_0.graph
          end
          local result = (self.network:ensure_graph({
            id = id
          })):clear({
            id = id
          })
          local output_message = RuntimeMessages.graph.output.clear(result)
          return output_message
        end
      },
      network = { },
      trace = { }
    }
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
      self.log_commands = true
      if options.log_commands then
        self.log_commands = options.log_commands
      end
      self.log_command_contents = true
      if options.log_command_contents then
        self.log_command_contents = options.log_command_contents
      end
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
