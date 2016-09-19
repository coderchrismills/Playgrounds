import Foundation

public func makeTestGraph() -> Graph<String> {
    let graph = Graph<String>()
    let a = graph.addNode("a")
    let b = graph.addNode("b")
    let c = graph.addNode("c")
    let d = graph.addNode("d")
    let e = graph.addNode("e")
    let f = graph.addNode("f")
    let g = graph.addNode("g")
    let h = graph.addNode("h")

    a <--> b
    a <--> c
    b <--> d
    b <--> e
    c <--> f
    c <--> g
    e <--> h
    e <--> f
    f <--> g
    
    return graph
}

public func makeTestDiGraph() -> Graph<String> {
    let graph = Graph<String>()
    let a = graph.addNode("a")
    let b = graph.addNode("b")
    let c = graph.addNode("c")
    let d = graph.addNode("d")
    let e = graph.addNode("e")
    let f = graph.addNode("f")
    let g = graph.addNode("g")
    let h = graph.addNode("h")
    
    a --> b
    b --> e
    c --> a
    c <--> g
    d --> b
    e --> h
    e --> f
    f --> c
    f --> g
    
    return graph
}
