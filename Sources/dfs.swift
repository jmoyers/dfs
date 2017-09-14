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
  }

  // O(1) after findAllConnected
  func connected(_ v : Int, _ w : Int) -> Bool {
    return connected[v] == connected[w]
  }

  func findAllConnected() {
    while unvisited.count > 0 {
      let connectedTo = dfs(start: unvisited[0])

      for vertex in connectedTo {
        connected[vertex] = connectedCount
      }

      connectedCount += 1
    }
  }

  override func reset() {
    super.reset()
    connected = [Int](repeating: -1, count: graph.vertexCount)
    connectedCount = 0
  }

  @discardableResult func dfs(start v: Int = 0) -> [Int] {
    if started == false {
      started = true
      stackStart = Thread.callStackSymbols.count
    }
    
    let spacer = String(repeating: "| ", 
      count: Thread.callStackSymbols.count - stackStart)

    print("\(spacer)Search \(v)")

    visited[v] = true

    var neighbors = graph.adjacent(v) ?? []

    for w in neighbors {
      if visited[w] == false {
        neighbors += dfs(start: w)

        print("\(spacer)\(w) = \(v)")
        pathBack[w] = v
      }
    }

    return neighbors
  }
}
