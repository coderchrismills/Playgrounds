import Foundation

public typealias SearchResult<E> = (Bool, [E]?)

public func bfs<E:Comparable>(graph: Graph<E>, startNode: Node<E>?, targetNode:Node<E>?) -> SearchResult<E> {
    guard let startNode = startNode else { return (false, nil) }
    guard let targetNode = targetNode else { return (false, nil) }
    guard (graph.contains(node: startNode)) else { return (false, nil) }
    guard (graph.contains(node: targetNode)) else  { return (false, nil) }
    
    var visited: [E] = []
    var found = false
    
    var queue = Queue<Node<E>>()
    queue.enqueue(element: startNode)
    
    while(!queue.isEmpty) {
        let n = queue.dequeue()!
        if(n == targetNode) {
            found = true
            visited.append(n.value)
            break;
        }
        
        visited.append(n.value)
        for e in n.Edges {
            if(visited.contains(e.Node2.value)) { continue }
            queue.enqueue(element: e.Node2)
        }
    }
    return (found, visited)
}

public func dfs<E:Comparable>(graph: Graph<E>, startNode: Node<E>?, targetNode:Node<E>?) -> SearchResult<E> {
    guard let startNode = startNode else { return (false, nil) }
    guard let targetNode = targetNode else { return (false, nil) }
    guard (graph.contains(node: startNode)) else { return (false, nil) }
    guard (graph.contains(node: targetNode)) else  { return (false, nil) }
    
    var visited: [E] = []
    var found = false
    
    var stack = Stack<Node<E>>()
    stack.push(element: startNode)
    
    while(!stack.isEmpty) {
        let n = stack.pop()!
        if(n == targetNode) {
            found = true
            visited.append(n.value)
            break;
        }
        
        visited.append(n.value)
        for e in n.Edges {
            if(visited.contains(e.Node2.value)) { continue }
            stack.push(element: e.Node2)
        }
    }
    return (found, visited)
}
