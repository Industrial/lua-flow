# LuaFlow

LuaFlow is a runtime for [Flow Based Programming](https://en.wikipedia.org/wiki/Flow-based_programming).

It implements the [FBP Protocol](http://flowbased.github.io/fbp-protocol/) over HTTP WebSocket.

Components are written using [Lua](https://lua.org) or [MoonScript](https://moonscript.org). Messages are sent/received using [ZeroMQ](https://zeromq.org).

## Status

In development. I'm setting up the WebSocket server implementation in Lua now
and using fbp-protocol integration test suite to test the implementation.

### Commands

#### Runtime
| Command         | Input / Output           | Implemented                |
|-----------------|--------------------------|----------------------------|
| error           | Input & Output           | :heavy_multiplication_x:   |
| getruntime      | Input                    | :heavy_check_mark:         |
| packet          | Input & Output           | :heavy_multiplication_x:   |
| packetsent      | Output                   | :heavy_multiplication_x:   |
| ports           | Output                   | :heavy_multiplication_x:   |
| runtime         | Output                   | :heavy_check_mark:         |

#### Component
| Command         | Input / Output | Implemented              |
|-----------------|----------------|--------------------------|
| component       | Output         | :heavy_multiplication_x: |
| componentsready | Output         | :heavy_multiplication_x: |
| error           | Input & Output | :heavy_multiplication_x: |
| getsource       | Input          | :heavy_multiplication_x: |
| list            | Input          | :heavy_multiplication_x: |
| source          | Input & Output | :heavy_multiplication_x: |

#### Graph
| Command       | Input / Output | Implemented              |
|---------------|----------------|--------------------------|
| addedge       | Input & Output | :heavy_check_mark:       |
| addgroup      | Input & Output | :heavy_multiplication_x: |
| addinitial    | Input & Output | :heavy_check_mark:       |
| addinport     | Input & Output | :heavy_multiplication_x: |
| addnode       | Input & Output | :heavy_check_mark:       |
| addoutport    | Input & Output | :heavy_multiplication_x: |
| changeedge    | Input & Output | :heavy_multiplication_x: |
| changegroup   | Input & Output | :heavy_multiplication_x: |
| changenode    | Input & Output | :heavy_check_mark:       |
| clear         | Input & Output | :heavy_check_mark:       |
| error         | Input & Output | :heavy_multiplication_x: |
| removeedge    | Input & Output | :heavy_multiplication_x: |
| removegroup   | Input & Output | :heavy_multiplication_x: |
| removeinitial | Input & Output | :heavy_multiplication_x: |
| removeinport  | Input & Output | :heavy_multiplication_x: |
| removenode    | Input & Output | :heavy_multiplication_x: |
| removeoutport | Input & Output | :heavy_multiplication_x: |
| renamegroup   | Input & Output | :heavy_multiplication_x: |
| renameinport  | Input & Output | :heavy_multiplication_x: |
| renamenode    | Input & Output | :heavy_multiplication_x: |
| renameoutport | Input & Output | :heavy_multiplication_x: |

#### Network
| Command      | Input / Output | Implemented              |
|--------------|----------------|--------------------------|
| begingroup   | Output         | :heavy_multiplication_x: |
| connect      | Output         | :heavy_multiplication_x: |
| data         | Output         | :heavy_multiplication_x: |
| debug        | Input          | :heavy_multiplication_x: |
| disconnect   | Output         | :heavy_multiplication_x: |
| edges        | Input & Output | :heavy_multiplication_x: |
| endgroup     | Output         | :heavy_multiplication_x: |
| error        | Input & Output | :heavy_multiplication_x: |
| getstatus    | Input          | :heavy_multiplication_x: |
| icon         | Output         | :heavy_multiplication_x: |
| output       | Output         | :heavy_multiplication_x: |
| persist      | Input          | :heavy_multiplication_x: |
| processerror | Output         | :heavy_multiplication_x: |
| start        | Input          | :heavy_multiplication_x: |
| started      | Output         | :heavy_multiplication_x: |
| status       | Output         | :heavy_multiplication_x: |
| stop         | Input & Output | :heavy_multiplication_x: |

#### Trace
| Command | Input / Output | Implemented              |
|---------|----------------|--------------------------|
| clear   | Input & Output | :heavy_multiplication_x: |
| dump    | Input & Output | :heavy_multiplication_x: |
| error   | Input & Output | :heavy_multiplication_x: |
| start   | Input & Output | :heavy_multiplication_x: |
| stop    | Input & Output | :heavy_multiplication_x: |

## Future Plans

- Run a Graph:
  - In-Process (default)
  - Inter-Process
  - TCP
