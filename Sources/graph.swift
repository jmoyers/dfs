class Digraph {
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
  }
  
  func adjacent(_ v : Int) -> [Int]? {
    return vertices[v]
  }

  func contains(_ v : Int) -> Bool {
    return vertices.indices.contains(v)
  }
}

class Graph : Digraph {
  override func edge(_ v : Int, _ w : Int) {
    vertices[v].append(w)
    vertices[w].append(v)
  }
}
