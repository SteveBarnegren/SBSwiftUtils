//
//  Array+Insertion.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

// MARK: - Prepend

public extension Array {
    
    
    mutating func prepend(_ item: Element) {
        insert(item, at: 0)
    }
    
    mutating func prepend<C>(contentsOf newElements: C) where C: Collection, Element == C.Element {
        insert(contentsOf: newElements, at: 0)
    }
}

// MARK: - Prepending

public extension Array {
    
    func prepending(_ item: Element) -> [Element] {
        var newArray = self
        newArray.insert(item, at: 0)
        return newArray
    }
    
    func prepending<C>(contentsOf newElements: C) -> [Element] where C: Collection, Element == C.Element {
        var newArray = self
        newArray.insert(contentsOf: newElements, at: 0)
        return newArray
    }
}

// MARK: - Appending

public extension Array {
    
    func appending(_ item: Element) -> [Element] {
        var newArray = self
        newArray.append(item)
        return newArray
    }
    
    func appending<C>(contentsOf newElements: C) -> [Element] where C: Collection, Element == C.Element {
        
        if count == 0 {
            return Array(newElements)
        } else {
            var newArray = self
            newArray.insert(contentsOf: newElements, at: newArray.count)
            return newArray
        }
    }
}
