Graph processing problems

* Path: is there a path between s and t?
* Shortest Path: what is the hsortest path between s and t?
                                                                           
* Cycle: is there a cycle in the graph? Short circuit detection for instance
* Euler tour: is there a cycle that uses each edge exactly once?
* Hamilton tour: is there a cycle that uses each vertax exactly once?
                                                                           
* Connectivity: is there a way to connect all of the vertices?
* MST (minimal spanning tree): What is the best way to connect the verticies
* Biconnectivity: is there a vertex whose removal discconects the graph?
                                                                           
* Planarity: Can you draw the graph in the plane with no crossing edges?
* Graph isopmorphism: Do two adjacency lists represent the same graph?
                                                                           
We'll use adjacency-list representation for storage
For every vertex, we'll keep a list of connected vertexes
Array<Int> -> Array<Int>
