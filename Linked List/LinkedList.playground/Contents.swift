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
    
    //subscript to make grabbing value at given index faster via syntax then method above
    public subscript(index: Int) -> T? {
        let node = nodeAt(index)
        guard let myNode = node else { return nil }
        return myNode.value
    }
    
    
    //===========================================================================
    //TODO: Add methods for removing elements: all, or given index, last or first
    
    func removeAll() {
        head = nil
    }
    
    func remove(node: Node) -> Node {
        
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        node.next = nil
        node.previous = nil
        return node
    }
    
    func removeLast() -> Node? {
        if !isEmpty {
            return remove(node: last!)
        }
        return nil
    }
    
    func removeFirst() -> Node? {
        if !isEmpty {
            return remove(node: first!)
        }
        return nil
    }
    
    func removeAt(index: Int) -> Node? {
        let node = nodeAt(index)
        if let node = node {
            return remove(node: node)
        }
        return nil
    }
    
    //===========================================================================
    //Description method to print elements in LinkedList array style
    
    //===========================================================================
    
    //helper method to grab two previous and next node for inserting in between
    func nodesBeforeAndAfter(_ index: Int) -> (Node?, Node?) {
        assert(index >= 0)
            
        var next = head
        var prev : Node?
        var i = index
        
        while i > 0 && next != nil {
            
            prev = next
            next = next?.next
            i -= 1
        }
        assert(i == 0)
        
        return (prev, next)
        
    }
    
    //insert inbetween two nodes at given index
    func insertAt(_ value: T, index: Int) {
        
        let (prev, next) = nodesBeforeAndAfter(index)
        
        let newNode = Node(value: value)
        newNode.previous = prev
        newNode.next = next
        prev?.next = newNode
        next?.previous = newNode
        
        if prev == nil {
            head = newNode
        }
    }
    
    //TODO: add map and filter methods
    
    //TODO: add method to print items in LinkedList
    
    //TODO: keep track of count of array to reduce count var runtime to O(1)
    
    //TODO: Reverse the linked list (fairly easy if tail functionality is implemented)
    
    //TODO: (Final) add tail functionality (keeps track of last node in list)
}

extension LinkedList : CustomStringConvertible {
    public var description : String {
        var listValues = "["
        var node = head
        
        while node != nil {
            listValues += "\(node!.value)"
            node = node?.next
            if node != nil { listValues += ","}
        }
        
        return listValues + "]"
    }
}


var newList = LinkedList<String>()
newList.append("Mikael")
newList.head?.value
newList.append("Alem")
newList.append("Meladee")
newList.append("Sewit")
//newList.count
//newList.last?.value



newList.insertAt("Terry", index: 1)
newList.insertAt("Ben", index: 0)

//newList.removeLast()?.value
newList.removeFirst()?.value













































































