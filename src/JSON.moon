serpent = require "serpent"
cjson = require "cjson"

class JSON
  encode: (input) =>
    cjson.encode input

  decode: (input) =>
    cjson.decode input

  is_null: (value) =>
    value == cjson.null
