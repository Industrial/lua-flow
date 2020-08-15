# LuaFlow

LuaFlow is a runtime for [Flow Based Programming](https://en.wikipedia.org/wiki/Flow-based_programming).

It implements the [FBP Protocol](http://flowbased.github.io/fbp-protocol/) over HTTP WebSocket.

Components are written using [Lua](https://lua.org) or [MoonScript](https://moonscript.org). Messages are sent/received using [ZeroMQ](https://zeromq.org).

## Future Plans

- Run a Graph:
  - In-Process (default)
  - Inter-Process
  - TCP
