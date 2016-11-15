import Foundation

//DEQUE, (Double-ended Queue)

/*
 Deque's allow you to add and remove items to both ends of a stack (like an array)
 */

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


/*
 Because the average runtime here is O(n) due to adding and removing elements from front, this can be made more effecient by utilizing a similar method used to optimize the Queue, using place holder elements and garbage collecting those elements at apropriate times. this will reduce run time average to O(1) as well.
 */



public struct OptimizedDeque<T> {
    
    private var array : [T?]
    private var head : Int
    private var capacity : Int
    
    public init(_ capacity: Int = 10) {
        self.capacity = max(capacity, 1)
        array = .init(repeatElement(nil, count: capacity))
        head = capacity
    }
    
    public var count : Int {
        return array.count - head
    }
    
    public var isEmpty : Bool {
        //count variable computes size of array and if no non nil element are in array, return false, else true
        return count == 0
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func enqueueFront(_ element: T) {
        
        //check if there is room in front to copy element and handle if not 
        if head == 0 {
            let emptySpace = Array<T?>(repeatElement(nil, count: capacity))
            array.insert(contentsOf: emptySpace, at: 0)
            head = capacity
        }
        
        //replace head with element and move head left one space
        head -= 1
        array[head] = element
    }
    
    public mutating func dequeue() -> T? {
        //remove element at place head and then move head right one space
        guard head < array.count, let element = array[head] else {  return nil }
        
        array[head] = nil
        head += 1
        
        return element
    }
    
    public mutating func dequeueBack() -> T? {
        guard !isEmpty else { return nil }
        return array.popLast()!
    }
    
    func peek() -> [T?] {
        return array
    }
    
}

var someOptimizedQueue = OptimizedDeque<String>()
someOptimizedQueue.peek()
someOptimizedQueue.enqueueFront("Ben")
someOptimizedQueue.peek()
someOptimizedQueue.enqueueFront("Heger")
someOptimizedQueue.peek()
someOptimizedQueue.enqueueFront("Alem")
someOptimizedQueue.enqueueFront("Tim")
someOptimizedQueue.enqueueFront("Kayla")
someOptimizedQueue.enqueueFront("Rahwa")
someOptimizedQueue.enqueueFront("Mike")
someOptimizedQueue.enqueueFront("Tirhas")
someOptimizedQueue.enqueueFront("Aaron")
someOptimizedQueue.peek()
someOptimizedQueue.enqueueFront("heather")
someOptimizedQueue.peek()
someOptimizedQueue.enqueueFront("Amanda")
someOptimizedQueue.peek()










































