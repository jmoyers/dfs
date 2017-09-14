import Foundation

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
g.edge(18, 19)

var dfs = DFS(graph:g)
print(GraphSearch.pretty(dfs.path(to:17)))
print(dfs.unvisted)

// Connectivity queries
// Goal: preprocess graph to answer queries of the form is v connected to w?
//  CONSTANT TIME

// Sounds similar to UnionFind, but this algorithm is faster
// Based on the fact that "is connected to" is an equivalence relation
// * Reflexive: v is connected to v
// * Symmetric: w -> v = v -> w
// * Transitive: v -> w, w -> x = v -> x

// A connected component is a "maximal set", so all connected vertices belong
// to one component. Just iterate over unvisited vertexes, dfs, and add an
// array that keeps track of a component id
