//
//  Array+Chunking.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

// MARK: - Chunked By Size

public extension Array {
    
    func chunked(size: Int) -> [[Element]] {
        
        return stride(from: 0, to: self.count, by: size).map {
            let chunkStart = $0
            let chunkEnd = Swift.min($0 + size, self.count)
            return self[chunkStart..<chunkEnd].toArray()
        }
    }
}

// MARK: - Chunked At Change To

public extension Array {
    
    func chunked<T: Equatable>(atChangeTo key: (Element) -> T) -> [[Element]] {
        
        var groups = [[Element]]()
        
        func addGroup(_ groupToAdd: [Element]) {
            if groupToAdd.isEmpty == false {
                groups.append(groupToAdd)
            }
        }
        
        var lastKey: T?
        var currentGroup = [Element]()
        
        for item in self {
            let itemKey = key(item)
            if itemKey == lastKey {
                currentGroup.append(item)
            } else {
                addGroup(currentGroup)
                currentGroup.removeAll()
                currentGroup.append(item)
            }
            lastKey = itemKey
        }
        
        addGroup(currentGroup)
        return groups
    }
}

// MARK: - Chunked Ascending / Descending

public extension Array where Element: Comparable {
    
    func chunkedAscending() -> [[Element]] {
        return self.sortedAscending().chunked(atChangeTo: { $0 })
    }
    
    func chunkedDescending() -> [[Element]] {
        return self.sortedDescending().chunked(atChangeTo: { $0 })
    }
}

// MARK: - Chunked Ascending / Descending By

public extension Array {
    
    func chunkedAscendingBy<T: Comparable>(key: (Element) -> T) -> [[Element]] {
        return self.sortedAscendingBy(key).chunked(atChangeTo: key)
    }
    
    func chunkedDescendingBy<T: Comparable>(key: (Element) -> T) -> [[Element]] {
        return self.sortedDescendingBy(key).chunked(atChangeTo: key)
    }
}
