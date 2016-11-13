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
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return array.removeFirst()
    }
    
    public mutating func peek() -> Array<T> {
        return array
    }
    
}

var someQueue = Queue(array: ["Mikael", "Natalie"])
someQueue.enqueue("Crazy")
someQueue.dequeue()
someQueue.peek()


/*
 When dequeueing, objects in array need to be shifted in memory to condense the array one space (from dequeued element) which takes O(n) operation. To make this more effecient we can replace dequeued element in array with placeholder, O(1) operation (much faster) and shift elements to front only so often. The larger operation being O(n) (when shifting) but because its done only so often, average run time is O(1)
 */

public struct OptimizedQueue<T> {
    
    fileprivate var array = [T?]()
    private var head = 0
    
    public var isEmpty : Bool {
        return array.isEmpty
    }
    
    public var count : Int {
        return array.count
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        array[head] = nil
        head += 1
        
        //the next 4 lines check to see if array is ready to be shifted
        let percentage = Double(head)/Double(array.count)
        if array.count > 30 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public mutating func peek() -> Array<T?> {
        return array
    }
    
}

var someOtimizedQueue = OptimizedQueue<String>()
someOtimizedQueue.array = ["Mikael", "Finan", "Finana", "Fenan"]
someOtimizedQueue.dequeue()
someOtimizedQueue.peek()


















