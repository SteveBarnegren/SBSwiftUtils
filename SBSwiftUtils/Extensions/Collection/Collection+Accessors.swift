//
//  Collection+Accessors.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 18/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

// MARK: - Maybe Subscript

public extension Collection where IndexDistance == Int, Index == Int {
    
    subscript(maybe index: Int) -> Element? {
        get {
            if index > count - 1 {
                return nil
            } else if index < 0 {
                return nil
            } else {
                return self[index]
            }
        }
    }
}

// MARK: - Throwing Accessor

public enum CollectionAccessError: Error {
    case outOfBounds
}

public extension Collection where IndexDistance == Int, Index == Int {
    
    func at(throwing index: Index) throws -> Element {
        
        if index < count {
            return self[index]
        } else {
            throw CollectionAccessError.outOfBounds
        }
    }
}
