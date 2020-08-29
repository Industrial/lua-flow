serpent = require "serpent"

JSON = require "JSON"

class Node
  new: (options) =>
    -- print "Node#new"

    @id = 'Node'
    @metadata = {}
    @in_ports = {}
    @out_ports = {}

    import id, metadata from options

    @set_id id if id
    @set_metadata metadata if metadata

  set_id: (id) =>
    @id = id

  set_metadata: (metadata) =>
    -- print "Node#set_metadata"

    for k, v in pairs metadata
      if JSON\is_null v
        @metadata[k] = nil
      else
        @metadata[k] = v

  add_in_port: (port) =>
    -- print "Node#add_in_port"

    @in_ports[port.id] = port

  remove_in_port: (port) =>
    -- print "Node#remove_in_port"

    @in_ports[port.id] = nil

  add_out_port: (port) =>
    -- print "Node#add_out_port"

    @out_ports[port.id] = port

  remove_out_port: (port) =>
    -- print "Node#remove_out_port"

    @out_ports[port.id] = nil
