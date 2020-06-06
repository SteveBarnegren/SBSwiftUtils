//
//  NDWeakObjectSet.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 06/06/2020.
//  Copyright © 2020 SteveBarnegren. All rights reserved.
//

import Foundation

/// Weak set that is used for notification dispatcher. This implemention doesn't
/// constrain `T` to `AnyObject` and so should not be used as a general purpose weak
/// set type. Insertions / removals also don't match expected set performance.
struct NDWeakObjectSet<T>: Sequence {
    
    private var weakArray = NDWeakArray<T>()
    
    public var count: Int {
        return weakArray.count
    }
    
    public init() {}
    
    public func makeIterator() -> IndexingIterator<[T]> {
        return weakArray.makeIterator()
    }
    
    public mutating func insert(object: T) {
        if weakArray.contains(object: object) == false {
            weakArray.append(object)
        }
    }
    
    public mutating func remove(object: T) {
        weakArray.remove(object: object)
    }
    
    public mutating func removeAll() {
        weakArray.removeAll()
    }
}
