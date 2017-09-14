## Graph processing notes

* Path: is there a path between s and t?
* Shortest Path: what is the hsortest path between s and t?

<br/>

* Cycle: is there a cycle in the graph? Short circuit detection for instance
* Euler tour: is there a cycle that uses each edge exactly once?
* Hamilton tour: is there a cycle that uses each vertax exactly once?

<br/>

* Connectivity: is there a way to connect all of the vertices?
* MST (minimal spanning tree): What is the best way to connect the verticies
* Biconnectivity: is there a vertex whose removal discconects the graph?

* For topological sort, we look at a Digraph and DFS. In general, the "reverse
dfs postorder of a DAG (diacyclic graph, directed graph with no cycles) is 
topological order". Reverse postorder means that you get the deepest node in 
a dfs and put it on a stack once there are no other unvisited nodes to explore.

<br/>

* Planarity: Can you draw the graph in the plane with no crossing edges?
* Graph isopmorphism: Do two adjacency lists represent the same graph?

## Implementation Details

* We'll use adjacency-list representation for storage
* dfs also computed connected components for O(1) lookup

## Output main
<pre>
Depth-first
Search 0
| Search 1
| | Search 2
| | | Search 8
| | | | Search 9
| | | | | Search 10
| | | | | | Search 11
| | | | | | | Search 17
| | | | | | 17 = 11
| | | | | | | Search 12
| | | | | | | | Search 13
| | | | | | | | | Search 14
| | | | | | | | | | Search 15
| | | | | | | | | | | Search 16
| | | | | | | | | | 16 = 15
| | | | | | | | | 15 = 14
| | | | | | | | 14 = 13
| | | | | | | 13 = 12
| | | | | | 12 = 11
| | | | | 11 = 10
| | | | 10 = 9
| | | 9 = 8
| | 8 = 2
| | | Search 6
| | | | Search 7
| | | 7 = 6
| | 6 = 2
| | | Search 3
| | | | Search 4
| | | | | Search 5
| | | | 5 = 4
| | | 4 = 3
| | 3 = 2
| 2 = 1
1 = 0
Search 18
| Search 19
19 = 18
17 -> 11 -> 10 -> 9 -> 8 -> 2 -> 1 -> 0
0 -> 19? false
0 -> 17? false
connected [-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1]
unvisited []

Breadth-first
Search 0
Search 1
Search 11
Search 2
Search 12
Search 17
Search 8
Search 6
Search 3
Search 13
Search 9
Search 7
Search 4
Search 14
Search 10
Search 5
Search 15
Search 16
17 -> 11 -> 0
unvisited [18, 19]

Reverse postorder (topological sort)
[18, 19, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]
</pre>
