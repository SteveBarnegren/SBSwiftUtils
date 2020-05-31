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
}
