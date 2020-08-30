# LuaFlow

LuaFlow is a runtime for [Flow Based Programming](https://en.wikipedia.org/wiki/Flow-based_programming).

It implements the [FBP Protocol](http://flowbased.github.io/fbp-protocol/) over HTTP WebSocket.

Components are written using [Lua](https://lua.org) or [MoonScript](https://moonscript.org). Messages are sent/received using [ZeroMQ](https://zeromq.org).

## Status

In development. I'm setting up the WebSocket server implementation in Lua now
and using fbp-protocol integration test suite to test the implementation.

### Commands

| Subprotocol | Command       | Implemented              |
|-------------|---------------|--------------------------|
| Runtime     | getruntime    | :heavy_check_mark:       |
| Runtime     | packet        | :heavy_multiplication_x: |
| Runtime     | packetsent    | :heavy_multiplication_x: |
| Runtime     | ports         | :heavy_multiplication_x: |
| Runtime     | runtime       | :heavy_multiplication_x: |
|-------------|---------------|--------------------------|
| Component   | getsource     | :heavy_multiplication_x: |
| Component   | list          | :heavy_multiplication_x: |
| Component   | source        | :heavy_multiplication_x: |
|-------------|---------------|--------------------------|
| Graph       | addedge       | :heavy_multiplication_x: |
| Graph       | addgroup      | :heavy_multiplication_x: |
| Graph       | addinport     | :heavy_multiplication_x: |
| Graph       | addnode       | :heavy_multiplication_x: |
| Graph       | addoutport    | :heavy_multiplication_x: |
| Graph       | changeedge    | :heavy_multiplication_x: |
| Graph       | changegroup   | :heavy_multiplication_x: |
| Graph       | changenode    | :heavy_multiplication_x: |
| Graph       | clear         | :heavy_multiplication_x: |
| Graph       | error         | :heavy_multiplication_x: |
| Graph       | removeedge    | :heavy_multiplication_x: |
| Graph       | removegroup   | :heavy_multiplication_x: |
| Graph       | removeinitial | :heavy_multiplication_x: |
| Graph       | removeinport  | :heavy_multiplication_x: |
| Graph       | removenode    | :heavy_multiplication_x: |
| Graph       | removeoutport | :heavy_multiplication_x: |
| Graph       | renamegroup   | :heavy_multiplication_x: |
| Graph       | renameinport  | :heavy_multiplication_x: |
| Graph       | renamenode    | :heavy_multiplication_x: |
| Graph       | renameoutport | :heavy_multiplication_x: |
|-------------|---------------|--------------------------|
| Network     | begingroup    | :heavy_multiplication_x: |
| Network     | connect       | :heavy_multiplication_x: |
| Network     | data          | :heavy_multiplication_x: |
| Network     | debug         | :heavy_multiplication_x: |
| Network     | disconnect    | :heavy_multiplication_x: |
| Network     | edges         | :heavy_multiplication_x: |
| Network     | endgroup      | :heavy_multiplication_x: |
| Network     | error         | :heavy_multiplication_x: |
| Network     | getstatus     | :heavy_multiplication_x: |
| Network     | icon          | :heavy_multiplication_x: |
| Network     | output        | :heavy_multiplication_x: |
| Network     | persist       | :heavy_multiplication_x: |
| Network     | processerror  | :heavy_multiplication_x: |
| Network     | start         | :heavy_multiplication_x: |
| Network     | started       | :heavy_multiplication_x: |
| Network     | status        | :heavy_multiplication_x: |
| Network     | stop          | :heavy_multiplication_x: |
|-------------|---------------|--------------------------|
| Trace       | clear         | :heavy_multiplication_x: |
| Trace       | dump          | :heavy_multiplication_x: |
| Trace       | start         | :heavy_multiplication_x: |
| Trace       | stop          | :heavy_multiplication_x: |

## Future Plans

- Run a Graph:
  - In-Process (default)
  - Inter-Process
  - TCP
