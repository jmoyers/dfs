import Foundation

// Depth first search
// Can model in terms of a maze
//   Every intersection in the maze is a vertex
//   Every passge is an edge

// Tremaux maze exploration
//  Unroll a ball of string behind you
//  Mark each visited intersection and each visited passage
//  Retrace steps when no unvisited options

// Recursive algorithm
//  DFS(to visit a vertex v)
//  Mark v as visited
//  Recursively visit all unmarked vertices w adjacent to v

class DFS : GraphSearch {
  var connected : [Int]
  var connectedCount : Int = 0

  var started = false
  var stackStart = 0
  
  override init(graph: Graph) {
    connected = [Int](repeating: -1, count: graph.vertexCount)
    super.init(graph: graph)
    dfs()
  }

  @discardableResult func dfs(start v: Int = 0) -> GraphSearch {
    if started == false {
      started = true
      stackStart = Thread.callStackSymbols.count
    }
    
    let spacer = String(repeating: "| ", 
      count: Thread.callStackSymbols.count - stackStart)

    print("\(spacer)Search \(v)")

    visited[v] = true

    for w in graph.adjacent(v) ?? [] {
      if visited[w] == false {
        dfs(start: w)
        print("\(spacer)\(w) = \(v)")
        pathBack[w] = v
      }
    }

    return self
  }
}
