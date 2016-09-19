import AppKit

func verifyResults<E>(_ results:SearchResult<E>) -> NSColor where E : Comparable {
    guard let path = results.1 else { return TestResult.Fail.color }
    let found = results.0
    print("\tFound: \(found)")
    print("\tPath: \(path)")
    return test(condition: found)
}

let graph = makeTestGraph()
print("Graph")
print(graph.debugDescription)
print("")

print("Graph BFS: a -> d")
var a = graph.getNode(for: "a")
var d = graph.getNode(for: "d")
var results = bfs(graph: graph, startNode: a, targetNode: d)
verifyResults(results)

print("Graph BFS : a -> h")
a = graph.getNode(for: "a")
var h = graph.getNode(for: "h")
results = bfs(graph: graph, startNode: a, targetNode: h)
verifyResults(results)

print("Graph DFS: a -> h")
results = dfs(graph: graph, startNode: a, targetNode: h)
verifyResults(results)

print("")
print("Di-Graph")
let diGraph = makeTestDiGraph()
print(diGraph.debugDescription)
print("")

print("Di-Graph BFS: a -> d")
a = diGraph.getNode(for: "a")
d = diGraph.getNode(for: "d")
results = bfs(graph: diGraph, startNode: a, targetNode: d)
verifyResults(results)

print("Di-Graph BFS: a -> h")
h = diGraph.getNode(for: "h")
results = bfs(graph: diGraph, startNode: a, targetNode: h)
verifyResults(results)

print("Di-Graph DFS: a -> c")
let c = diGraph.getNode(for: "c")
results = dfs(graph: diGraph, startNode: a, targetNode: c)
verifyResults(results)
