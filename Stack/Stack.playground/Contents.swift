//: Playground - noun: a place where people can play

import Foundation

public struct Stack<T> {
    
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count : Int {
        return array.count
    }
    
    public mutating func push(element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public mutating func peek() -> T? {
        return array.last
    }
    
}


//var someStack = Stack(array: [])
//someStack.push(element: "Mikael")
//someStack.push(element: "Alem")
////someStack.isEmpty
//someStack.pop()
//someStack.count
