//
//  Optional+BoolTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Optional_BoolTests: XCTestCase {

    // MARK: - Nil Or False
    
    func testTrueBoolShouldNotBeNilOrFalse() {
        
        let bool: Bool? = true
        XCTAssertEqual(bool.isNilOrFalse, false)
    }
    
    func testFalseBoolShouldBeNilOrFalse() {
        
        let bool: Bool? = false
        XCTAssertEqual(bool.isNilOrFalse, true)
    }
    
    func testNilBoolShouldBeNilOrFalse() {
        
        let bool: Bool? = nil
        XCTAssertEqual(bool.isNilOrFalse, true)
    }
    
    // MARK: - Is True
    
    func testNilBoolShouldBeFalse() {
        
        let bool: Bool? = nil
        XCTAssertEqual(bool.isTrue, false)
    }
    
    func testFalseBoolShouldBeFalse() {
        
        let bool: Bool? = false
        XCTAssertEqual(bool.isTrue, false)
    }
    
    func testTrueBoolShouldBeTrue() {
        
        let bool: Bool? = true
        XCTAssertEqual(bool.isTrue, true)
    }

}
