local Node = require("./Node")
local Port = require("./Port")
return describe("Node", function()
  describe("#constructor", function()
    it("should set a name", function()
      local node = Node({
        name = "Node"
      })
      local expected = "Node"
      local actual = node.name
      return assert.are.equal(actual, expected)
    end)
    it("should set an in_ports table", function()
      local node = Node({
        name = "Node"
      })
      local expected = "table"
      local actual = type(node.in_ports)
      return assert.are.same(actual, expected)
    end)
    return it("should set an out_ports table", function()
      local node = Node({
        name = "Node"
      })
      local expected = "table"
      local actual = type(node.out_ports)
      return assert.are.same(actual, expected)
    end)
  end)
  describe("#add_in_port", function()
    return it("should add the port", function()
      local node = Node({
        name = "Node"
      })
      local port = Port({
        name = "Port"
      })
      node:add_in_port(port)
      local expected = "Port"
      local actual = node.in_ports.Port.name
      return assert.are.same(actual, expected)
    end)
  end)
  describe("#remove_in_port", function()
    return it("should remove the port", function()
      local node = Node({
        name = "Node"
      })
      local port = Port({
        name = "Port"
      })
      node:add_in_port(port)
      node:remove_in_port(port)
      local expected = nil
      local actual = node.in_ports.Port
      return assert.are.same(actual, expected)
    end)
  end)
  describe("#add_out_port", function()
    return it("should add the port", function()
      local node = Node({
        name = "Node"
      })
      local port = Port({
        name = "Port"
      })
      node:add_out_port(port)
      local expected = "Port"
      local actual = node.out_ports.Port.name
      return assert.are.same(actual, expected)
    end)
  end)
  return describe("#remove_out_port", function()
    return it("should remove the port", function()
      local node = Node({
        name = "Node"
      })
      local port = Port({
        name = "Port"
      })
      node:add_out_port(port)
      node:remove_out_port(port)
      local expected = nil
      local actual = node.out_ports.Port
      return assert.are.same(actual, expected)
    end)
  end)
end)
