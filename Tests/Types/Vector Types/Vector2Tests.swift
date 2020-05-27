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
    
    // MARK: - Test Vector 2
    
    func testVector2SetCorrectValuesWithDefaultInitializer() {
        
        let v = Vector2(1, 2)
        XCTAssertEqual(v.v0, 1)
        XCTAssertEqual(v.v1, 2)
    }
    
    func testVector2SetCorrectValuesWithXYInitializer() {
        
        let v = Vector2(x: 1, y: 2)
        XCTAssertEqual(v.v0, 1)
        XCTAssertEqual(v.v1, 2)
    }
    
    func testVector2GetCorrectValuesWithXYGetters() {
        
        let v = Vector2(1, 2)
        XCTAssertEqual(v.x, 1)
        XCTAssertEqual(v.y, 2)
    }
    
    func testVector2SetCorrectValuesWithXYSetters() {
        
        var v = Vector2(0, 0)
        v.x = 10
        v.y = 11
        XCTAssertEqual(v.v0, 10)
        XCTAssertEqual(v.v1, 11)
    }
}
