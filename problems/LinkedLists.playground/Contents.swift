import Foundation


class ListNode<T> {
    var value: T
    var next: ListNode?
    var prev: ListNode?
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    public typealias Node = ListNode<T>
    private var head : Node?
    private var tail : Node?
    private var nodeCount = 0
    
    public var first : Node? {
        return head
    }
    
    public var last : Node? {
        return tail
    }
    
    public var isEmpty : Bool {
        return head == nil
    }
    
    public var count : Int {
        if var node = head {
            var c = 1
            while case let next? = node.next {
                c += 1
                node = next
            }
            return c
        } else {
            return 0
        }
    }
    
    public var length : Int {
        return nodeCount
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let node = tail {
            nodeCount += 1
            node.next = newNode
            newNode.prev = node
            self.tail = newNode
        } else {
            nodeCount += 1
            head = newNode
            tail = newNode
        }
    }
    
    public func remove(node: Node) {
        let prev = node.prev
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.prev = prev
        nodeCount -= 1
    }
    
}

//var myList = LinkedList<String>()
//myList.append(value: "Mikael")
//myList.append(value: "Nelson")
//myList.append(value: "John")
//myList.append(value: "Jessica")
//myList.length
////myList.count
//
//myList.remove(node: myList.first!)
//myList.length
//myList.first?.value




var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
func fizzBuzz(array: [Int]) {
    for num in array {
        if num % 3 == 0 && num % 5 == 0 {
            print("FizzBuzz")
        } else if num % 5 == 0 {
            print("Buzz")
        } else if num % 3 == 0 {
            print("Fizz")
        } else {
            print("...")
        }
    }
}

fizzBuzz(array: array)



























