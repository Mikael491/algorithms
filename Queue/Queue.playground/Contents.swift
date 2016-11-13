import Foundation

//Queues
/*
 Queues are data structures in which elements are pulled in first-in first-out order (FIFO), 
 elements are queued to one end of an array structure and dequeued from the other end.
 elements enqueued and dequeued take O(1) operation
 */
public struct Queue<T> {
    
    fileprivate var array = [T]()
    
    public var isEmpty : Bool {
        return array.isEmpty
    }
    
    var count : Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.insert(element, at: 0)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return array.popLast()
    }
    
    public mutating func peek() -> Array<T> {
        return array
    }
    
}

var someQueue = Queue(array: ["Mikael", "Natalie"])
someQueue.enqueue("Crazy")
someQueue.dequeue()
someQueue.peek()
