//
//  HashTable.swift
//  DataStructures
//
//  Created by Vladimir Gogunsky on 2/10/21.
//

public struct HashTable <Key: Hashable, Value> {
    
    private typealias Element = (key: Key, value: Value?)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    public subscript(key: Key) -> Value? {
        get {
            return self.value(for: key)
        }
        
        set {
            let index = self.index(for: key)
            if let elementId = self.buckets.object(at: index)?.firstIndex(where: { $0.key == key }) {
                self.buckets[index][elementId].value = newValue
            } else {
                self.buckets[index].append((key: key, value: newValue))
            }
        }
    }
    
    public init(capacity: Int = 100) {
        self.buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    private func value(for key: Key) -> Value? {
        let index = self.index(for: key)
        let bucket = self.buckets[index]
        return bucket.first { $0.key == key }?.value
    }
    
    private func index(for key: Key) -> Int {
        return abs(key.hashValue % self.buckets.count)
    }
}

extension Array {
    func object(at index: Int) -> Element? {
        guard index >= 0 && index < self.count else { return nil }
        return self[index]
    }
}
