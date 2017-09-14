class BFS : GraphSearch {
  // An interesting side effect is that naturally pathBack will contain
  // the shortest path available to get from one node to another
  @discardableResult func bfs(start v: Int = 0) -> [Int] {
    var q = [v]
    visited[v] = true

    var neighbors = [Int]()

    while (q.count > 0) {
      let next = q[0]
      q.remove(at:0)

      print("Search \(next)")

      for w in graph.adjacent(next) ?? [] {
        if visited[w] == false {
          q.append(w)
          visited[w] = true
          pathBack[w] = next
          neighbors.append(w)
        }
      }
    }

    return neighbors
  }
}

