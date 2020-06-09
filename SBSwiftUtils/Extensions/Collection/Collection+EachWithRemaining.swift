//
//  Collection+EachWithRemaining.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 09/06/2020.
//  Copyright © 2020 SteveBarnegren. All rights reserved.
//

import Foundation

extension Collection {
    /// Returns a sequence of (Element, [Element]). Each element in the collection is
    /// returned in the first item in the tuple. The second item of the tuple contains
    /// the suffix of the collection, starting from the next element.
    public func eachWithRemaining() -> EachWithRemainingSequence<Self> {
        return EachWithRemainingSequence(collection: self)
    }
}

public struct EachWithRemainingSequence<WrappedCollection: Collection>: Sequence, IteratorProtocol {
    
    public typealias Element = (WrappedCollection.Element, WrappedCollection.SubSequence)
    
    private let wrappedCollection: WrappedCollection
    private var currentIndex: WrappedCollection.Index
    
    init(collection: WrappedCollection) {
        self.wrappedCollection = collection
        currentIndex = wrappedCollection.startIndex
    }
    
    mutating public func next() -> Element? {
        
        if currentIndex >= wrappedCollection.endIndex {
            return nil
        }
        
        let value = wrappedCollection[currentIndex]
        
        let nextIndex = wrappedCollection.index(after: currentIndex)
        let remianing = wrappedCollection.suffix(from: nextIndex)
        
        currentIndex = nextIndex
        return (value, remianing)
    }
}
