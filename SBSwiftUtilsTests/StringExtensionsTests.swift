//
//  SBSwiftUtilsTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steven Barnegren on 25/04/2017.
//  Copyright © 2017 SteveBarnegren. All rights reserved.
//

import XCTest
@testable import SBSwiftUtils

class SBSwiftUtilsTests: XCTestCase {
    
    // MARK: - Trimmed() tests
    
    func testTrimmedStringRemovesLeadingAndTrailingSpaces() {
        
        let testString = "hello   "
        XCTAssertEqual(testString.trimmed(), "hello")
    }
    
    func testTrimmedStringRemovesLeadingAndTrailingNewLines() {
        
        let testString = "\n\nhello\n\n"
        XCTAssertEqual(testString.trimmed(), "hello")
    }
    
    func testTrimmedStringRemovesLeadingAndTrailingTabs() {
        
        let testString = "\t\thello\t\t"
        XCTAssertEqual(testString.trimmed(), "hello")
    }
    
}
