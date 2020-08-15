class Node
  new: (options) =>
    @name = options.name
    @in_ports = {}
    @out_ports = {}

  add_in_port: (port) =>
    @in_ports[port.name] = port

  remove_in_port: (port) =>
    @in_ports[port.name] = nil

  add_out_port: (port) =>
    @out_ports[port.name] = port

  remove_out_port: (port) =>
    @out_ports[port.name] = nil
