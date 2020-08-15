local Port = require("Port")
return describe("Port", function()
  return describe("#constructor", function()
    return it("should set a name", function()
      local port = Port({
        name = "Port"
      })
      local expected = "Port"
      local actual = port.name
      return assert.are.equal(actual, expected)
    end)
  end)
end)
