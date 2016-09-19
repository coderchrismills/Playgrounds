import Foundation

public struct Queue<T> {
    private var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func enqueue(element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if(isEmpty) { return nil }
        return array.removeFirst()
    }
    
    public func peek() -> T? {
        return array.first
    }
}

public struct Stack<T> {
    private var array = [T]()
    
    public init() {}
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        if(isEmpty) { return nil }
        return array.removeLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
}
