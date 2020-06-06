//
//  NDWeakArray.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 06/06/2020.
//  Copyright © 2020 SteveBarnegren. All rights reserved.
//

//swiftlint:disable force_cast

import Foundation

struct NDWeakItemWrapper {
    
    private weak var p_object: AnyObject?
    
    init(object: AnyObject) {
        p_object = object
    }
    
    var object: AnyObject? {
        return p_object
    }
}

/// Because of limitations in Swift's type system, this version of the weak array
/// accepts `T` rather than `T: Anyobject`. This is required for the
/// NotificationDispatcher generics to work. Any `T` that doesn't conform to
/// `AndyObject` will instead throw a fatal error.
struct NDWeakArray<T>: RandomAccessCollection, Sequence {
    
    // MARK: - Manage wrapped items
    
    private var wrappedItems: [NDWeakItemWrapper]
    
    mutating func removeDeallocatedItems() {
        wrappedItems = wrappedItems.filter { $0.object != nil }
    }
    
    var unwrappedItems: [T] {
        return wrappedItems.compactMap { $0.object as? T }
    }
    
    // MARK: - Init
    
    init() {
        wrappedItems = [NDWeakItemWrapper]()
    }
    
    var count: Int {
        return unwrappedItems.count
    }
    
    init(objects: [T]) {
        guard let anyObjects = objects as [AnyObject]? else {
            fatalAnyObjectError()
        }
        wrappedItems = anyObjects.map(NDWeakItemWrapper.init)
    }
    
    init(objects: T...) {
        guard let anyObjects = objects as [AnyObject]? else {
            fatalAnyObjectError()
        }
        wrappedItems = anyObjects.map(NDWeakItemWrapper.init)
    }
    
    // MARK: - Add / Remove
    
    mutating func append(_ newElement: T) {
        removeDeallocatedItems()
        
        guard let anyObject = newElement as AnyObject? else {
            fatalAnyObjectError()
        }
        
        wrappedItems.append( NDWeakItemWrapper(object: anyObject) )
    }
    
    mutating func removeAll() {
        wrappedItems.removeAll()
    }
        
    mutating func removeAll(where shouldRemove: (T) -> Bool) {
        
        wrappedItems = wrappedItems
            .compactMap { $0.object }
            .filter { !shouldRemove($0 as! T) }
            .map(NDWeakItemWrapper.init)
    }
    
    mutating func remove(object: T) {
        self.removeAll(where: { ($0 as AnyObject) === (object as AnyObject) })
    }
    
    // MARK: - Contains
    
    func contains(object: T) -> Bool {
        return contains { ($0 as AnyObject) === (object as AnyObject) }
    }
    
    // MARK: - For Each
    
    func forEach(_ body: @escaping (Element) throws -> Void) rethrows {
        try unwrappedItems.forEach(body)
    }
    
    // For-in
    
    func makeIterator() -> IndexingIterator<[T]> {
        return unwrappedItems.makeIterator()
    }
    
    // MARK: - RandomAccessCollection typealias Index = Int
    typealias Element = T
    typealias Index = Array<NDWeakItemWrapper>.Index
    
    var startIndex: Index { return unwrappedItems.startIndex }
    var endIndex: Index { return unwrappedItems.endIndex }
    
    subscript(index: Index) -> Element {
        return unwrappedItems[index]
    }
    
    func index(after i: Index) -> Index {
        return unwrappedItems.index(after: i)
    }
    
    func index(before i: NDWeakArray<T>.Index) -> NDWeakArray<T>.Index {
        return unwrappedItems.index(before: i)
    }
}

extension NDWeakArray where T: AnyObject {
    mutating func remove(object: T) {
        self.removeAll(where: { $0 === object })
    }
}

private func fatalAnyObjectError() -> Never {
    fatalError("WeakArray can only work with types conforming to AnyObject")
}
