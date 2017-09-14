class GraphSearch {
  var graph : Graph

  var pathBack : [Int]
  var visited : [Bool]
  
  var unvisted : [Int] {
    get {
      return visited.enumerated().filter { $1 == false }
        .map { offset, element in
          return offset
        }
    }
  }

  init(graph: Graph) {
    self.graph = graph
    pathBack = [Int](repeating: -1, count: graph.vertexCount)
    visited = [Bool](repeating: false, count: graph.vertexCount)
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
