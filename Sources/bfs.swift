class BFS : GraphSearch {
  @discardableResult func bfs(start v: Int = 0) -> GraphSearch {
    var q = [v]
    visited[v] = true

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

