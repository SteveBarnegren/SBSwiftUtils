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

// MARK: - Equatable

extension Vector2: Equatable where T: Equatable {
    public static func == (lhs: Vector2, rhs: Vector2) -> Bool {
        return lhs.v0 == rhs.v0 && lhs.v1 == rhs.v1
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

// MARK: - Magnitude

extension Vector2 where T: FloatingPoint {
    
    /// The magnitude of the vector
    public var magnitude: T {
        return sqrt(x*x + y*y)
    }
    
    /// Creates a vector with the same direction and a magnitude of 1
    public func normalized() -> Self {
        let length = sqrt(x*x+y*y)
        return Self(x/length, y/length)
    }
    
    /// Creates a vector with the same direction and the passed in magnitude
    public func with(magnitude newMagnitude: T) -> Self {
        return self.normalized() * newMagnitude
    }
}

// MARK: - Dot Product

extension Vector2 where T: FloatingPoint {
    
    // The dot product of the vector with the passed in vector
    public func dotProduct(with other: Self) -> T {
        return (self.x * other.x) + (self.y * other.y)
    }
}

// MARK: - Distance

extension Vector2 where T: FloatingPoint {
    
    /// The distance to another vector
    public func distance(to other: Self) -> T {
        let xDiff = other.x - x
        let yDiff = other.y - y
        return sqrt(xDiff*xDiff+yDiff*yDiff)
    }
    
    /// The distance squared to another vector. Avoids the square root operation for
    /// speed. Useful for distance comparisions, where the exact distance doesn't need
    /// to be known.
    public func distanceSquared(to other: Self) -> T {
        let xDiff = other.x - x
        let yDiff = other.y - y
        return xDiff*xDiff + yDiff*yDiff
    }
}

// MARK: - Vector Operators

public func + <T>(lhs: Vector2<T>, rhs: Vector2<T>) -> Vector2<T> where T: AdditiveArithmetic {
    return Vector2<T>(lhs.x + rhs.x, lhs.y + rhs.y)
}

public func - <T>(lhs: Vector2<T>, rhs: Vector2<T>) -> Vector2<T> where T: AdditiveArithmetic {
    return Vector2<T>(lhs.x - rhs.x, lhs.y - rhs.y)
}

public func += <T>(lhs: inout Vector2<T>, rhs: Vector2<T>) where T: AdditiveArithmetic {
    lhs.x += rhs.x
    lhs.y += rhs.y
}

public func -= <T>(lhs: inout Vector2<T>, rhs: Vector2<T>) where T: AdditiveArithmetic {
    lhs.x -= rhs.x
    lhs.y -= rhs.y
}
 
// MARK: - Scalar Operators

public func * <T>(lhs: Vector2<T>, rhs: T) -> Vector2<T> where T: Numeric {
    return Vector2<T>(lhs.x * rhs, lhs.y * rhs)
}

public func * <T>(lhs: T, rhs: Vector2<T>) -> Vector2<T> where T: Numeric {
    return Vector2<T>(rhs.x * lhs, rhs.y * lhs)
}

public func *= <T>(lhs: inout Vector2<T>, rhs: T) where T: Numeric {
    lhs.x *= rhs
    lhs.y *= rhs
}

public func / <T>(lhs: Vector2<T>, rhs: T) -> Vector2<T> where T: FloatingPoint {
    return Vector2<T>(lhs.x / rhs, lhs.y / rhs)
}

public func /= <T>(lhs: inout Vector2<T>, rhs: T) where T: FloatingPoint {
    lhs.x /= rhs
    lhs.y /= rhs
}
