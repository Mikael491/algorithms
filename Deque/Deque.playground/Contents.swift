import Foundation

//DEQUE, (Double-ended Queue)

//Simple version with runtime of O(n) due to enqueue() and dequeueFront() operations

public struct Deque<T> {
    
    fileprivate var array = [T]()
    
    public var count : Int {
        return array.count
    }
    
    public var isEmpty : Bool {
        return array.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element: T) {
        array.insert(element, at: 0)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return array.removeFirst()
    }
    
    public mutating func dequeueBack() -> T? {
        guard !isEmpty else { return nil }
        return array.popLast()
    }
    
    public mutating func peekFront() -> T? {
        guard !isEmpty else { return nil }
        return array.first!
    }
    
    public mutating func peekBack() -> T? {
        guard !isEmpty else { return nil }
        return array.last!
    }
    
}

var someDeque = Deque(array: ["Mikael", "Mela", "Meron", "Astair"])

someDeque.peekBack()
someDeque.enqueueFront("Mery")
someDeque.array















