//
//  Vector3Tests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 27/05/2020.
//  Copyright © 2020 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Vector3Tests: XCTestCase {
    
    // MARK: - Test Vector 3
    
    func testVector3SetCorrectValuesWithDefaultInitializer() {
        
        let v = Vector3(1, 2, 3)
        XCTAssertEqual(v.v0, 1)
        XCTAssertEqual(v.v1, 2)
        XCTAssertEqual(v.v2, 3)
    }
    
    func testVector3SetCorrectValuesWithXYZInitializer() {
        
        let v = Vector3(x: 1, y: 2, z: 3)
        XCTAssertEqual(v.v0, 1)
        XCTAssertEqual(v.v1, 2)
        XCTAssertEqual(v.v2, 3)
    }
    
    func testVector3GetCorrectValuesWithXYZGetters() {
        
        let v = Vector3(1, 2, 3)
        XCTAssertEqual(v.x, 1)
        XCTAssertEqual(v.y, 2)
        XCTAssertEqual(v.z, 3)
    }
    
    func testVector3SetCorrectValuesWithXYZSetters() {
        
        var v = Vector3(0, 0, 0)
        v.x = 1
        v.y = 2
        v.z = 3
        XCTAssertEqual(v.v0, 1)
        XCTAssertEqual(v.v1, 2)
        XCTAssertEqual(v.v2, 3)
    }
    
    func testVector3SetCorrectValuesWithRGBInitializer() {
        
        let v = Vector3(r: 1, g: 2, b: 3)
        XCTAssertEqual(v.v0, 1)
        XCTAssertEqual(v.v1, 2)
        XCTAssertEqual(v.v2, 3)
    }
    
    func testVector3GetCorrectValuesWithRGBGetters() {
        
        let v = Vector3(1, 2, 3)
        XCTAssertEqual(v.r, 1)
        XCTAssertEqual(v.g, 2)
        XCTAssertEqual(v.b, 3)
    }
    
    func testVector3SetCorrectValuesWithRGBSetters() {
        
        var v = Vector3(0, 0, 0)
        v.r = 1
        v.g = 2
        v.b = 3
        XCTAssertEqual(v.v0, 1)
        XCTAssertEqual(v.v1, 2)
        XCTAssertEqual(v.v2, 3)
    }
}
