//
//  Vector2.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 27/05/2020.
//  Copyright © 2020 SteveBarnegren. All rights reserved.
//

import Foundation

/// A generic Vector2 type
public struct Vector2<T> {
    
    public init(_ v0: T, _ v1: T) {
        self.v0 = v0
        self.v1 = v1
    }
    
    public init(x: T, y: T) {
        self.v0 = x
        self.v1 = y
    }
    
    public var v0: T
    public var v1: T
    
    public var x: T {
        get { return v0 }
        set { v0 = newValue }
    }
    public var y: T {
        get { return v1 }
        set { v1 = newValue }
    }
}

// MARK: - Slope

extension Vector2 where T: FloatingPoint {
    
    /// The slope of this vector
    public var slope: T {
        return y / x
    }
    
    // The slope from this vector to another vector
    public func slope(to other: Self) -> T {
        return (other.y - self.y) / (other.x - self.x)
    }
}
