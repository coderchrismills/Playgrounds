import Foundation
import AppKit

precedencegroup SequencePrecedence {
    associativity: left
    higherThan: AdditionPrecedence
}

public class Node<E: Comparable> {
    var value: E
    var Edges:[Edge<E>] = []
    init(value: E) {
        self.value = value
    }
    func connected(to: Node<E>) -> Bool {
        return Edges.contains(where: { $0.Node2 == to})
    }
}

infix operator -->: SequencePrecedence
infix operator <-->: SequencePrecedence
extension Node where E:Comparable {
    public static func -->(lhs: Node<E>, rhs: Node<E>){
        if lhs.connected(to: rhs) { return }
        lhs.Edges.append(Edge(n1: lhs, n2: rhs))
    }
    
    public static func <-->(lhs: Node<E>, rhs: Node<E>) {
        if lhs.connected(to: rhs) { return }
        if rhs.connected(to: lhs) { return }
        lhs.Edges.append(Edge(n1: lhs, n2: rhs))
        rhs.Edges.append(Edge(n1: rhs, n2: lhs))
    }
    
}

extension Node:Equatable {
    public static func ==(lhs: Node<E>, rhs: Node<E>) -> Bool {
        return lhs.value == rhs.value
    }
}

public class Edge<E: Comparable> {
    let Node1: Node<E>
    let Node2: Node<E>
    init(n1: Node<E>, n2: Node<E>) {
        self.Node1 = n1
        self.Node2 = n2
    }
}

public class Graph<E:Comparable> {
    var Nodes:[Node<E>] = []
    public var NodeCount: Int { return Nodes.count }
    public init() { }

    public func addNode(_ value: E) -> Node<E> {
        if let n = getNode(for: value) { return n }
        Nodes.append(Node(value: value))
        return Nodes.last!
    }
    
    public func contains(node: Node<E>?) -> Bool {
        guard let node = node else { return false }
        return Nodes.contains(where: { $0.value == node.value})
    }
    
    public func getNode(for value: E) -> Node<E>? {
        return Nodes.first(where: {$0.value == value})
    }
}

extension Node: CustomDebugStringConvertible {
    public var debugDescription: String {
        var s = "\(value) -> ("
        for i in stride(from: 0, to: Edges.count-1, by: 1) {
            s += "\(Edges[i].Node2.value),"
        }
        if let last = Edges.last?.Node2.value {
            s += "\(last)"
        }
        s += ")"
        return s
    }
}
extension Graph: CustomDebugStringConvertible {
    public var debugDescription: String {
        var s = ""
        for n in Nodes {
            s += n.debugDescription
            s += "\n"
        }
        return s
    }
}



