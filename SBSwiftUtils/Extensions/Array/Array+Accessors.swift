//
//  Array+Accessors.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

// MARK: - Maybe Subscript

public extension Array {
    
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

public extension Array {
    
    enum ArrayAccessError: Error {
        case outOfBounds
    }
    
    func at(throwing index: Int) throws -> Element {
        
        if index < count {
            return self[index]
        } else {
            throw ArrayAccessError.outOfBounds
        }
    }
}

// MARK: - Pop First

public extension Array {
    
    mutating func popFirst() -> Element? {
        
        if self.isEmpty {
            return nil
        } else {
            return self.remove(at: 0)
        }
    }
}
