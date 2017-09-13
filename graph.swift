// Graph processing problems
// Path: is there a path between s and t?
// Shortest Path: what is the hsortest path between s and t?

// Cycle: is there a cycle in the graph? Short circuit detection for instance
// Euler tour: is there a cycle that uses each edge exactly once?
// Hamilton tour: is there a cycle that uses each vertax exactly once?

// Connectivity: is there a way to connect all of the vertices?
// MST (minimal spanning tree): What is the best way to connect the verticies
// Biconnectivity: is there a vertex whose removal discconects the graph?

// Planarity: Can you draw the graph in the plane with no crossing edges?
// Graph isopmorphism: Do two adjacency lists represent the same graph?

// We'll use adjacency-list representation for storage
// For every vertex, we'll keep a list of connected vertexes
// Array<Int> -> Array<Int>

import Foundation

class Graph {
  var vertices : [[Int]]

  var vertexCount : Int { 
    get {
      return vertices.count
    }
  }

  var edgeCount : Int { 
    get {
      return (vertices.reduce(0) { acc, next in
        acc + next.count
      }) / 2
    }
  }

  init(vertexCount: Int) {
    vertices = [[Int]](repeating: [], count: vertexCount)
  }

  func edge(_ v : Int, _ w : Int) {
    vertices[v].append(w)
    vertices[w].append(v)
  }
  
  func adjacent(_ v : Int) -> [Int]? {
    return vertices[v]
  }

  func contains(_ v : Int) -> Bool {
    return vertices.indices.contains(v)
  }
}


//var g = Graph(vertexCount: 10)
//g.edge(0, 1)
//g.edge(0, 9)
//print(g.adjacent(0) ?? "nil")
//print("edgeCount: \(g.edgeCount), vertexCount: \(g.vertexCount)")

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

class GraphSearch {
  var graph : Graph

  var pathBack : [Int]
  var visited : [Bool]

  var started = false
  var stackStart = 0

  init(graph: Graph) {
    self.graph = graph
    self.pathBack = [Int](repeating: -1, count: graph.vertexCount)
    self.visited = [Bool](repeating: false, count: graph.vertexCount)
  }

  func reset() {
    pathBack = [Int](repeating: -1, count: graph.vertexCount)
    visited = [Bool](repeating: false, count: graph.vertexCount)
  }

  func path(to v: Int) -> [Int]? {
    guard pathBack[v] != -1 else {
      return nil
    }

    var to : [Int] = []
    var curr = pathBack[v]

    to.append(v)

    while (curr != -1) {
      to.append(curr)
      curr = pathBack[curr]
    }

    return to
  }

  func isConnected(to v: Int) -> Bool {
    return visited[v]
  }

  class func pretty(_ pathBack: [Int]?) -> String {
    guard let pathBack = pathBack else {
      return "no path available"
    }
    return pathBack.reduce("") {
      guard $0 != "" else { return "\($1)" }
      return "\($0) -> \($1)"
    }
  }
}


extension GraphSearch {
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

extension GraphSearch {
  @discardableResult func bfs() -> GraphSearch {
    var q = [0]
    visited[0] = true


    while (q.count > 0) {
      let next = q[0]
      q.remove(at:0)

      print("Search \(next)")

      for w in graph.adjacent(next) ?? [] {
        if visited[w] == false {
          q.append(w)
          visited[w] = true
          pathBack[w] = next
        }
      }
    }
    return self
  }
}


var g = Graph(vertexCount: 20)
g.edge(0, 1)
g.edge(1, 2)
g.edge(2, 8)
g.edge(5, 6)
g.edge(2, 6)
g.edge(0, 11)
g.edge(1, 12)
g.edge(11, 17)
g.edge(2, 3)
g.edge(3, 4)
g.edge(4, 5)
g.edge(5, 6)
g.edge(6, 7)
g.edge(7, 8)
g.edge(8, 9)
g.edge(9, 10)
g.edge(10, 11)
g.edge(11, 12)
g.edge(12, 13)
g.edge(13, 14)
g.edge(14, 15)
g.edge(15, 16)
g.edge(16, 17)

var search = GraphSearch(graph:g)
print(GraphSearch.pretty(search.dfs().path(to:17)))
search.reset()
print(GraphSearch.pretty(search.bfs().path(to:17)))
