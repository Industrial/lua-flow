local serpent = require("serpent")
local Node = require("Node")
local Port = require("Port")
return describe("Node", function()
  describe("#new", function()
    it("should set an id", function()
      local node = Node({
        id = "Node"
      })
      local expected = "Node"
      local actual = node.id
      return assert.are.same(expected, actual)
    end)
    it("should set an in_ports table", function()
      local node = Node({
        id = "Node"
      })
      local expected = "table"
      local actual = type(node.in_ports)
      return assert.are.same(expected, actual)
    end)
    return it("should set an out_ports table", function()
      local node = Node({
        id = "Node"
      })
      local expected = "table"
      local actual = type(node.out_ports)
      return assert.are.same(expected, actual)
    end)
  end)
  describe("#set_id", function()
    return it("should set an id", function()
      local node = Node({
        id = "Node"
      })
      node:set_id("Node1")
      local expected = "Node1"
      local actual = node.id
      return assert.are.same(expected, actual)
    end)
  end)
  describe("#set_metadata", function()
    describe("when the current metadata table is empty", function()
      describe("when called with an empty metadata table", function()
        return it("should leave an empty current metadata table", function()
          local node = Node({
            id = "Node"
          })
          local expected = { }
          local actual = node.metadata
          return assert.are.same(expected, actual)
        end)
      end)
      return describe("when called with a metadata table", function()
        return it("should update the current metadata table with the new metadata values", function()
          local node = Node({
            id = "Node"
          })
          node:set_metadata({
            a = "b",
            c = "d"
          })
          local expected = {
            a = "b",
            c = "d"
          }
          local actual = node.metadata
          return assert.are.same(expected, actual)
        end)
      end)
    end)
    return describe("when the metadata table is not empty", function()
      describe("when called with an empty metadata table", function()
        return it("should leave the current metadata table in the same state", function()
          local node = Node({
            id = "Node",
            metadata = {
              a = "b",
              c = "d"
            }
          })
          node:set_metadata({ })
          local expected = {
            a = "b",
            c = "d"
          }
          local actual = node.metadata
          return assert.are.same(expected, actual)
        end)
      end)
      return describe("when called with a metadata table", function()
        return it("should update the current metadata table with the new metadata values", function()
          local node = Node({
            id = "Node",
            metadata = {
              A = "b",
              C = "d"
            }
          })
          node:set_metadata({
            e = "f",
            g = "h"
          })
          local expected = {
            A = "b",
            C = "d",
            e = "f",
            g = "h"
          }
          local actual = node.metadata
          return assert.are.same(expected, actual)
        end)
      end)
    end)
  end)
  describe("#add_in_port", function()
    return it("should add the port", function()
      local node = Node({
        id = "Node"
      })
      local port = Port({
        id = "Port"
      })
      node:add_in_port(port)
      local expected = "Port"
      local actual = node.in_ports.Port.id
      return assert.are.same(expected, actual)
    end)
  end)
  describe("#remove_in_port", function()
    return it("should remove the port", function()
      local node = Node({
        id = "Node"
      })
      local port = Port({
        id = "Port"
      })
      node:add_in_port(port)
      node:remove_in_port(port)
      local expected = nil
      local actual = node.in_ports.Port
      return assert.are.same(expected, actual)
    end)
  end)
  describe("#add_out_port", function()
    return it("should add the port", function()
      local node = Node({
        id = "Node"
      })
      local port = Port({
        id = "Port"
      })
      node:add_out_port(port)
      local expected = "Port"
      local actual = node.out_ports.Port.id
      return assert.are.same(expected, actual)
    end)
  end)
  return describe("#remove_out_port", function()
    return it("should remove the port", function()
      local node = Node({
        id = "Node"
      })
      local port = Port({
        id = "Port"
      })
      node:add_out_port(port)
      node:remove_out_port(port)
      local expected = nil
      local actual = node.out_ports.Port
      return assert.are.same(expected, actual)
    end)
  end)
end)
