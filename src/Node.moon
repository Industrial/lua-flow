class Node
  new: (options) =>
    -- print "Node#new"

    @id = options.id
    @metadata = options.metadata
    @in_ports = {}
    @out_ports = {}

  set_id: (id) =>
    @id = id

  set_metadata: (metadata) =>
    @metadata = metadata

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
