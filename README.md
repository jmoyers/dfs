# Graph processing problems

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

<br/>

* Planarity: Can you draw the graph in the plane with no crossing edges?
* Graph isopmorphism: Do two adjacency lists represent the same graph?

# Impl

* We'll use adjacency-list representation for storage
* For every vertex, we'll keep a list of connected vertexes
* Array<Int> -> Array<Int>

```
Search 0
| Search 1
| | Search 2
| | | Search 8
| | | | Search 7
| | | | | Search 6
| | | | | | Search 5
| | | | | | | Search 4
| | | | | | | | Search 3
| | | | | | | 3 = 4
| | | | | | 4 = 5
| | | | | 5 = 6
| | | | 6 = 7
| | | 7 = 8
| | | | Search 9
| | | | | Search 10
| | | | | | Search 11
| | | | | | | Search 17
| | | | | | | | Search 16
| | | | | | | | | Search 15
| | | | | | | | | | Search 14
| | | | | | | | | | | Search 13
| | | | | | | | | | | | Search 12
| | | | | | | | | | | 12 = 13
| | | | | | | | | | 13 = 14
| | | | | | | | | 14 = 15
| | | | | | | | 15 = 16
| | | | | | | 16 = 17
| | | | | | 17 = 11
| | | | | 11 = 10
| | | | 10 = 9
| | | 9 = 8
| | 8 = 2
| 2 = 1
1 = 0
17 -> 11 -> 10 -> 9 -> 8 -> 2 -> 1 -> 0
Search 0
Search 1
Search 11
Search 2
Search 12
Search 17
Search 10
Search 8
Search 6
Search 3
Search 13
Search 16
Search 9
Search 7
Search 5
Search 4
Search 14
Search 15
17 -> 11 -> 0
```
