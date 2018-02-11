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
