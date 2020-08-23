local Port = require("Port")
return describe("Port", function()
  return describe("#new", function()
    return it("should set an id", function()
      local port = Port({
        id = "Port"
      })
      local expected = "Port"
      local actual = port.id
      return assert.are.equal(actual, expected)
    end)
  end)
end)
