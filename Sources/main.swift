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

print("Depth-first")

var dfs = DFS(graph:g)

dfs.findAllConnected()

print(prettyPath(dfs.path(to:17)))
print("0 -> 19?", dfs.connected(0, 19))
print("0 -> 17?", dfs.connected(0, 17))
print("connected", dfs.connected)
print("unvisited", dfs.unvisited)

print()
print("Breadth-first")

var bfs = BFS(graph:g)

bfs.bfs()

print(prettyPath(bfs.path(to:17)))
print("unvisited", bfs.unvisited)

print()
print("Reverse postorder")

var postorder = Postorder(graph:g)
postorder.exploreAll()
print(postorder.getReversePostorder())
