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
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first : Node? {
        return head
    }
    
    public var last : Node? {
        return tail
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
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let node = tail {
            node.next = newNode
            newNode.prev = node
            self.tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
    }
}

var myList = LinkedList<String>()
myList.append(value: "Mikael")
myList.append(value: "Nelson")
myList.append(value: "John")
myList.count

