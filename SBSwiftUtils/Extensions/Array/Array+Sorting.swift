//
//  Array+Sorting.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

// MARK: - Sort Ascending / Descending

public extension Array where Element: Comparable {
    
    func sortedAscending() -> [Element] {
        return sorted { $0 < $1 }
    }
    
    func sortedDescending() -> [Element] {
        return sorted { $0 > $1 }
    }
    
    mutating func sortAscending() {
        sort { $0 < $1 }
    }
    
    mutating func sortDescending() {
        sort { $0 > $1 }
    }
}

// MARK: - Sort Ascending / Descending By

public extension Array {
    
    func sortedAscendingBy<T: Comparable>(_ transform: (Element) -> T) -> [Element] {
        return sorted { transform($0) < transform($1) }
    }
    
    func sortedDescendingBy<T: Comparable>(_ transform: (Element) -> T) -> [Element] {
        return sorted { transform($0) > transform($1) }
    }
    
    mutating func sortAscendingBy<T: Comparable>(_ transform: (Element) -> T) {
        sort { transform($0) < transform($1) }
    }
    
    mutating func sortDescendingBy<T: Comparable>(_ transform: (Element) -> T) {
        sort { transform($0) > transform($1) }
    }
}

// MARK: - Bring To Front / Send To Back

public extension Array {
    
    mutating func bringToFront(_ matches: (Element) -> Bool) {
        
        var indexesToMove = [Int]()
        var itemsToMove = [Element]()
        
        // Find the items to move
        for (index, item) in self.enumerated() {
            if matches(item) {
                indexesToMove.append(index)
                itemsToMove.append(item)
            }
        }
        
        // Remove the last items first, so that the indexes are always in bounds
        for index in indexesToMove.reversed() {
            remove(at: index)
        }
        
        // Insert the items at the front
        // in the reverse order that we found them
        // so that they maintain their original order
        itemsToMove.reversed().forEach {
            insert($0, at: 0)
        }
    }
    
    mutating func sendToBack(_ matches: (Element) -> Bool) {
        
        var indexesToMove = [Int]()
        var itemsToMove = [Element]()
        
        // Find the items to move
        for (index, item) in self.enumerated() {
            if matches(item) {
                indexesToMove.append(index)
                itemsToMove.append(item)
            }
        }
        
        // Remove the last items first, so that the indexes are always in bounds
        for index in indexesToMove.reversed() {
            remove(at: index)
        }
        
        // Insert the items at the back
        itemsToMove.forEach {
            append($0)
        }
    }
}
