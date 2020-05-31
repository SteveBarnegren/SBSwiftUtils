//
//  Vector2Tests.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 27/05/2020.
//  Copyright © 2020 SteveBarnegren. All rights reserved.
//

import XCTest
import Foundation
import SBSwiftUtils

class Vector2Tests: XCTestCase {
    
    // MARK: - Init
    
    func test_DefaultInitializer() {
        
        let v = Vector2(1, 2)
        XCTAssertEqual(v.v0, 1)
        XCTAssertEqual(v.v1, 2)
    }
    
    func test_XYInitializer() {
        
        let v = Vector2(x: 1, y: 2)
        XCTAssertEqual(v.v0, 1)
        XCTAssertEqual(v.v1, 2)
    }
    
    // MARK: - Getters / Setters
    
    func test_XYGetters() {
        
        let v = Vector2(1, 2)
        XCTAssertEqual(v.x, 1)
        XCTAssertEqual(v.y, 2)
    }
    
    func test_XYSetters() {
        
        var v = Vector2(0, 0)
        v.x = 10
        v.y = 11
        XCTAssertEqual(v.v0, 10)
        XCTAssertEqual(v.v1, 11)
    }
    
    func test_WidthHeightGetters() {
        
        let v = Vector2(1, 2)
        XCTAssertEqual(v.width, 1)
        XCTAssertEqual(v.height, 2)
    }
    
    func test_WidthHeightSetters() {
        
        var v = Vector2(0, 0)
        v.width = 10
        v.height = 11
        XCTAssertEqual(v.width, 10)
        XCTAssertEqual(v.height, 11)
    }
    
    // MARK: - Equatable
    
    func test_Equatable() throws {
        
        XCTAssertEqual(Vector2(0, 0), Vector2(0, 0))
        XCTAssertEqual(Vector2(1, 1), Vector2(1, 1))
        XCTAssertEqual(Vector2(2, 2), Vector2(2, 2))

        XCTAssertNotEqual(Vector2(1, 2), Vector2(2, 2))
        XCTAssertNotEqual(Vector2(2, 1), Vector2(2, 2))
        XCTAssertNotEqual(Vector2(2, 1), Vector2(1, 2))
    }
    
    // MARK: - Slope
    
    func test_Slope() throws {
        XCTAssertEqual(Vector2(2.0, 4.0).slope, 2)
        XCTAssertEqual(Vector2(4.0, 2.0).slope, 0.5)
        XCTAssertEqual(Vector2(10.0, 10.0).slope, 1)
        XCTAssertEqual(Vector2(2.0, -5.0).slope, -2.5)
    }
    
    func test_SlopeToOther() throws {
        XCTAssertEqual(Vector2(2.0, 4.0).slope(to: Vector2(3.0, 6.0)), 2.0)
    }
    
    // MARK: - Magnitude
    
    func test_Magnitude() throws {
        // Accuracy to 2 decimal places
        let accuracy = 0.01
        
        XCTAssertEqual(Vector2(2.0, 2.0).magnitude, 2.82, accuracy: accuracy)
        XCTAssertEqual(Vector2(-2.0, -2.0).magnitude, 2.82, accuracy: accuracy)
        XCTAssertEqual(Vector2(3.0, 5.0).magnitude, 5.83, accuracy: accuracy)
    }
    
    func test_ChangeMagnitude() throws {
        
        let desiredMagnitude = 60.0
        let accuracy = 0.001
        
        var v = Vector2(2.0, 3.0)
        XCTAssertNotEqual(v.magnitude, desiredMagnitude, accuracy: accuracy)
        
        v = v.with(magnitude: desiredMagnitude)
        XCTAssertEqual(v.magnitude, desiredMagnitude, accuracy: 0.001)
    }
    
    // MARK: - Normalised
    
    func test_Normalized() throws {
        // Accuracy to 2 decimal places
        let accuracy = 0.01
        
        do {
            let v = Vector2(5.0, 5.0).normalized()
            XCTAssertEqual(v.x, 0.70, accuracy: accuracy)
            XCTAssertEqual(v.y, 0.70, accuracy: accuracy)
        }
        
        do {
            let v = Vector2(-5.0, -5.0).normalized()
            XCTAssertEqual(v.x, -0.70, accuracy: accuracy)
            XCTAssertEqual(v.y, -0.70, accuracy: accuracy)
        }
    }
    
    // MARK: - Dot Product
    
    func test_DotProduct() throws {
        
        let accuracy = 0.001
        let forward = Vector2(0.0, 1.0)
        let right = Vector2(1.0, 0.0)
        let backward = Vector2(0.0, -1.0)
        let left = Vector2(-1.0, 0.0)
        
        XCTAssertEqual(forward.dotProduct(with: forward), 1, accuracy: accuracy)
        XCTAssertEqual(forward.dotProduct(with: right), 0, accuracy: accuracy)
        XCTAssertEqual(forward.dotProduct(with: backward), -1.0, accuracy: accuracy)
        XCTAssertEqual(forward.dotProduct(with: left), 0, accuracy: accuracy)
    }
    
    // MARK: - Distance
    
    func test_DistanceToOther() throws {
        
        XCTAssertEqual(Vector2(1.0, 1.0).distance(to: Vector2(1.0, 4.0)), 3.0)
        XCTAssertEqual(Vector2(1.0, 1.0).distance(to: Vector2(1.0, -4.0)), 5.0)
    }
    
    func test_DistanceSquaredToOther() throws {
        XCTAssertEqual(Vector2(1.0, 1.0).distanceSquared(to: Vector2(1.0, 6.0)), 25.0)
    }
    
    // MARK: - Vector Operators
    
    func test_PlusOperator() throws {
        XCTAssertEqual(Vector2(1, 2) + Vector2(5, 5), Vector2(6, 7))
    }
    
    func test_SubtractOperator() throws {
        XCTAssertEqual(Vector2(5, 10) - Vector2(3, 2), Vector2(2, 8))
    }
    
    func test_PlusEqualsOperator() throws {
        var v = Vector2(1, 2)
        v += Vector2(5, 5)
        XCTAssertEqual(v, Vector2(6, 7))
    }
    
    func test_SubtractEqualsOperator() throws {
        var v = Vector2(5, 10)
        v -= Vector2(3, 2)
        XCTAssertEqual(v, Vector2(2, 8))
    }
    
    // MARK: - Scalar Operators
    
    func test_MultiplyWithScalar() throws {
        XCTAssertEqual(Vector2(4, 10) * 3, Vector2(12, 30))
        XCTAssertEqual(3 * Vector2(4, 10), Vector2(12, 30))
    }
    
    func test_MultiplyWithScalar_Mutating() throws {
        var v = Vector2(4, 10)
        v *= 3
        XCTAssertEqual(v, Vector2(12, 30))
    }
    
    func test_DivideByScalar() throws {
        XCTAssertEqual(Vector2(12.0, 30.0) / 3.0, Vector2(4.0, 10.0))
    }
    
    func test_DivideByScalar_Mutating() throws {
        var v = Vector2(12.0, 30.0)
        v /= 3.0
        XCTAssertEqual(v, Vector2(4.0, 10.0))
    }
}
