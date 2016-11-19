import Foundation

public struct HashTable<Key: Hashable, Value> {
    
    fileprivate typealias Element = (key: Key, value: Value)
    fileprivate typealias Bucket = [Element]
    private var buckets : [Bucket]
    
    private(set) var count = 0
    
    public init (capacity: Int) {
        
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
}

var hashTable1 = HashTable<String, String>(capacity: 20)
//hashTable1.buckets

//==================================
//insert
//hashTable1["firstName"] = "Mikael"

//update
//hashTable1["firstName"] = "Kidan"

//delete
//hashTable1["firstName"] = nil

//lookup 
//let me = hashTable1["firstName"]
