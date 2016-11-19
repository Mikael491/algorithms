import Foundation

public struct HashTable<Key: Hashable, Value> {
    
    fileprivate typealias Element = (key: Key, value: Value)
    fileprivate typealias Bucket = [Element]
    fileprivate var buckets : [Bucket]
    
    fileprivate(set) var count = 0
    
    public init (capacity: Int) {
        
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    fileprivate func index(forKey key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
}

var hashTable1 = HashTable<String, String>(capacity: 20)
//hashTable1.buckets

//==================================
//TODO: insert
//hashTable1["firstName"] = "Mikael"

//TODO: update
//hashTable1["firstName"] = "Kidan"

//TODO: delete
//hashTable1["firstName"] = nil

//TODO: lookup
//let me = hashTable1["firstName"]

extension HashTable {
    
    //lookup
    func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }
    
    //update, insert
    public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        //loop through chain and check for value, if found update
        let index = self.index(forKey: key)
        
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    //remove 
    public mutating func removeValue(forKey key: Key) -> Value? {
        //loop through hashtable chains, if value is found, delete
        
        return nil
    }
    
    
    public subscript(key: Key) -> Value? {
        
        get {
            return value(forKey: key)
        }
        
        set {
            
        }
        
    }
    
}
