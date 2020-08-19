serpent = require "serpent"

class Graph
  new: (options) =>
    @id = options.id
    @nodes = {}
    @edges = {}
    @initial = {}
    @components = {}
    @main = false
    @debugging = false
    @running = false
    @started = false
    @start_time = nil
    @base_dir = nil

  clear: (payload) =>
    import id, main, baseDir from payload

    @id = id
    @nodes = {}
    @edges = {}
    @initial = {}
    @components = {}
    @main = main
    @debugging = false
    @running = false
    @started = false
    @start_time = nil
    @base_dir = baseDir

    {
      id: @id
      main: @main
      baseDir: @base_dir
    }

  addnode: () =>

  removenode: () =>

  removenodeedges: () =>

  renamenode: () =>

  changenode: () =>

  addedge: (payload) =>
    print "addedge", serpent.block payload

  removeedge: () =>

  renameedge: () =>

  changeedge: () =>

  addinitial: () =>

  removeinitial: () =>

  addinport: () =>

  removeinport: () =>

  renameinport: () =>

  addoutport: () =>

  removeoutport: () =>

  renameoutport: () =>

  addgroup: () =>

  removegroup: () =>

  renamegroup: () =>

  changegroup: () =>

  getstatus: () =>

  start: () =>

  stop: () =>

  persist: () =>

  debug: () =>

  getedges: () =>

  list: () =>
