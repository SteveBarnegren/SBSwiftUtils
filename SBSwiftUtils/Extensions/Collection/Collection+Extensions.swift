//
//  Collection+Extensions.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

// MARK: - Last Index

public extension Collection {
    
    var lastIndex: Int? {
        
        if count - 1 >= 0 {
            return Int(count) - 1
        } else {
            return nil
        }
    }
}

// MARK: - Is Ascending / Descending

public extension Collection where Element: Comparable {
    
    var isAscending: Bool {
        
        var previousItem: Element?
        
        for item in self {
            
            if let previous = previousItem, previous > item {
                return false
            }
            
            previousItem = item
        }
        
        return true
    }
    
    var isDescending: Bool {
        
        var previousItem: Element?
        
        for item in self {
            
            if let previous = previousItem, previous < item {
                return false
            }
            
            previousItem = item
        }
        
        return true
    }
}
