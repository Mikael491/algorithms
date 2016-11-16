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
    
}





















































































