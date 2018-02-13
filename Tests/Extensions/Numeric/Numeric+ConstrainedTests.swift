//
//  Numeric+ConstrainedTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Numeric_ConstrainedTests: XCTestCase {

    func testConstrainedMax() {
        
        XCTAssertEqual(10.constrained(max: 5), 5)
        XCTAssertEqual(10.constrained(max: 10), 10)
        XCTAssertEqual(10.constrained(max: 12), 10)
        XCTAssertEqual(10.constrained(max: -2), -2)
    }
    
    func testConstrainedMin() {
        
        XCTAssertEqual(10.constrained(min: 5), 10)
        XCTAssertEqual(10.constrained(min: 10), 10)
        XCTAssertEqual(10.constrained(min: 12), 12)
        XCTAssertEqual(10.constrained(min: -2), 10)
    }
    
    func testConstrainedMinAndMax() {
        
        XCTAssertEqual(10.constrained(min: 0, max: 5), 5)
        XCTAssertEqual((-2).constrained(min: 0, max: 5), 0)
    }
}
