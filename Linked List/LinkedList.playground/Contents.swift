import Foundation

/*
 Linked Lists (Single and doubly)
 */



//Node for linked list
public class LinkedListNode<T> {
    
    var value : T
    
    
    //for double linked list we implement a previous variable
    //these can be nil so we make them optionals
    var next : LinkedListNode?
    weak var previous : LinkedListNode?
    //previous weak var is declared like so to break ownership cycles.
    
    
    public init (value: T) {
        self.value = value
    }
    
}


//Linked List Implementation
public class LinkedList<T> {
    
    public typealias Node = LinkedListNode<T>
    
    var head : Node?
    
    public var isEmpty : Bool {
        //if head is nil then then list has no items
        return head == nil
    }
    
    public var first : Node? {
        return head
    }
    
    //created a computed propeety that grabs last node in list.
    public var last : Node? {
        guard var node = head else { return nil }
        while case let next? = node.next {
            node = next
        }
        return node
    }
    
    //Both last variable and append funcs are O(n) runtime, expensive operations if linked list is very long. This can be made more effecient by a tail method or variable to keep track of last node in list
    
    //NOTE: class functions in structs that're generics should be mutating (LinkedList is a class)
    public func append(_ element: T) {
        let newNode = Node(value: element)
        guard head != nil else {
            head = newNode
            return
        }
        last?.next = newNode
        newNode.previous = last
    }
    
}























































































