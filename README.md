# LuaFlow

LuaFlow is a runtime for [Flow Based Programming](https://en.wikipedia.org/wiki/Flow-based_programming).

It implements the [FBP Protocol](http://flowbased.github.io/fbp-protocol/) over HTTP WebSocket.

Components are written using [Lua](https://lua.org) or [MoonScript](https://moonscript.org). Messages are sent/received using [ZeroMQ](https://zeromq.org).

## Status

In development. I'm setting up the WebSocket server implementation in Lua now
and using fbp-protocol integration test suite to test the implementation.

### Commands

#### Runtime
| Command       | Implemented              |
|---------------|--------------------------|
| getruntime    | :heavy_check_mark:       |
| packet        | :heavy_multiplication_x: |
| packetsent    | :heavy_multiplication_x: |
| ports         | :heavy_multiplication_x: |
| runtime       | :heavy_multiplication_x: |

#### Component
| Command       | Implemented              |
|---------------|--------------------------|
| getsource     | :heavy_multiplication_x: |
| list          | :heavy_multiplication_x: |
| source        | :heavy_multiplication_x: |

#### Graph
| Command       | Implemented              |
|---------------|--------------------------|
| addedge       | :heavy_multiplication_x: |
| addgroup      | :heavy_multiplication_x: |
| addinport     | :heavy_multiplication_x: |
| addnode       | :heavy_multiplication_x: |
| addoutport    | :heavy_multiplication_x: |
| changeedge    | :heavy_multiplication_x: |
| changegroup   | :heavy_multiplication_x: |
| changenode    | :heavy_multiplication_x: |
| clear         | :heavy_multiplication_x: |
| error         | :heavy_multiplication_x: |
| removeedge    | :heavy_multiplication_x: |
| removegroup   | :heavy_multiplication_x: |
| removeinitial | :heavy_multiplication_x: |
| removeinport  | :heavy_multiplication_x: |
| removenode    | :heavy_multiplication_x: |
| removeoutport | :heavy_multiplication_x: |
| renamegroup   | :heavy_multiplication_x: |
| renameinport  | :heavy_multiplication_x: |
| renamenode    | :heavy_multiplication_x: |
| renameoutport | :heavy_multiplication_x: |

#### Network
| Command       | Implemented              |
|---------------|--------------------------|
| begingroup    | :heavy_multiplication_x: |
| connect       | :heavy_multiplication_x: |
| data          | :heavy_multiplication_x: |
| debug         | :heavy_multiplication_x: |
| disconnect    | :heavy_multiplication_x: |
| edges         | :heavy_multiplication_x: |
| endgroup      | :heavy_multiplication_x: |
| error         | :heavy_multiplication_x: |
| getstatus     | :heavy_multiplication_x: |
| icon          | :heavy_multiplication_x: |
| output        | :heavy_multiplication_x: |
| persist       | :heavy_multiplication_x: |
| processerror  | :heavy_multiplication_x: |
| start         | :heavy_multiplication_x: |
| started       | :heavy_multiplication_x: |
| status        | :heavy_multiplication_x: |
| stop          | :heavy_multiplication_x: |

#### Trace
| Command       | Implemented              |
|---------------|--------------------------|
| clear         | :heavy_multiplication_x: |
| dump          | :heavy_multiplication_x: |
| start         | :heavy_multiplication_x: |
| stop          | :heavy_multiplication_x: |

## Future Plans

- Run a Graph:
  - In-Process (default)
  - Inter-Process
  - TCP
