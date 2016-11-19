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
    
    //TODO: Add a count variable
    public var count : Int? {
        guard head != nil else { return nil }
        var c = 1
        var node = head
        while case let next? = node?.next {
            node = next
            c += 1
        }
        return c
    }
    
    //method that retrieves a node at a given index
    func nodeAt(_ index: Int) -> Node? {
        
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                node = node?.next
                i -= 1
            }
        }
        return nil
    }
    
    
    public subscript(index: Int) -> T? {
        let node = nodeAt(index)
        guard let myNode = node else { return nil }
        return myNode.value
    }
    
    
    //===========================================================================
    //TODO: Add methods for removing elements: all, or given index, last or first
    
    
    
    
    
    
    
    
    
    //===========================================================================
    
    //TODO: add method for retrieving previous and next node (helper func) to add node inbetween
    
    //TODO: add map and filter methods
    
    //TODO: add method to print items in LinkedList
    
    //TODO: keep track of count of array to reduce count var runtime to O(1)
    
    //TODO: Reverse the linked list (fairly easy if tail functionality is implemented)
    
    //TODO: (Final) add tail functionality (keeps track of last node in list)
}


var newList = LinkedList<String>()
newList.append("Mikael")
newList.head?.value
newList.append("Alem")
newList.append("Meladee")
newList.append("Sewit")
//newList.count
//newList.last?.value





















































































