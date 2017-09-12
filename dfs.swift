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


class DFS {
  private(set) public var path : [Int]
  var visited : [Bool]
  var origin : Int

  var searchStarted = false
  var initialDepth = 0

  init(graph: Graph, origin: Int) {
    assert(graph.contains(origin))
    self.origin = origin
    self.path = [Int](repeating: -1, count: graph.vertexCount)
    self.visited = [Bool](repeating: false, count: graph.vertexCount)

    search(graph: graph, forVertex: origin)
  }

  func search(graph: Graph, forVertex v: Int) {
    if searchStarted == false {
      searchStarted = true
      initialDepth = Thread.callStackSymbols.count
    }
    
    let spacer = String(repeating: "| ", 
      count: Thread.callStackSymbols.count - initialDepth)

    print("\(spacer)Search \(v)")

    assert(visited.indices.contains(v))
    visited[v] = true

    for w in graph.adjacent(v) ?? [] {
      if visited[w] == false {
        search(graph: graph, forVertex: w)
        print("\(spacer)\(w) = \(v)")
        path[w] = v
      }
    }
  }

  func pathTo(graph: Graph, to v: Int) -> [Int]? {
    assert(graph.contains(v))

    guard path[v] != -1 else {
      return nil
    }

    var to : [Int] = []
    var curr = path[v]

    to.append(v)

    while (curr != -1) {
      to.append(curr)
      curr = path[curr]
    }

    return to
  }

  func isConnected(to v: Int) -> Bool {
    return visited[v]
  }

  class func pretty(_ path: [Int]?) -> String {
    guard let path = path else {
      return "no path available"
    }
    return path.reduce("") {
      guard $0 != "" else { return "\($1)" }
      return "\($0) -> \($1)"
    }
  }
}

var g = Graph(vertexCount: 10)
g.edge(0, 1)
g.edge(1, 2)
g.edge(2, 8)
g.edge(5, 6)

var search = DFS(graph: g, origin: 0)
let path = DFS.pretty(search.pathTo(graph: g, to: 8))
print()
print(path)
let path2 = DFS.pretty(search.pathTo(graph: g, to: 6))
print(path2)
