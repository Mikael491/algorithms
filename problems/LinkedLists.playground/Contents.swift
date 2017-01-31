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
}

var myList = LinkedList<String>()


