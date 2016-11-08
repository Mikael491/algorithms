//: Playground - noun: a place where people can play

import UIKit

class QuickFind {
    
    private var array : Array<Int>!
    
    init(int: Int) {
        array = [Int]()
        for i in 0...int {
            array.insert(i, at: i)
        }
    }
    
    func connected(p: Int, q: Int) -> Bool {
        return array[p] == array[q]
    }
    
    func union(p: Int, q: Int) {
        let pID = array[p]
        let qID = array[q]
        
        for i in array {
            if i == pID {
                array[i] = qID
            }
        }
    }
    
}

class QuickUnion {
    
    //make private later
    var array : Array<Int>!
    
    init(int: Int) {
        array = [Int]()
        for i in 0...int {
            array.insert(i, at: i)
        }
    }
    
    private func root(int: Int) -> Int {
        var i = Int()
        while int != array[i] {
            i = array[i]
        }
        return i
    }
    
    func connected(p: Int, q: Int) -> Bool {
        return root(int: p) == root(int: q)
    }
    
    func union (p: Int, q: Int) {
        let p = root(int: p)
        let q = root(int: q)
        array[p] = q
    }
    
    
}

