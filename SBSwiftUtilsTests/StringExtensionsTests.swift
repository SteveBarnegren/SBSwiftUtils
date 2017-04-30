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
    
    // MARK: - Contains() tests
    
    func testContainsReturnsTrueWhenSubstringIsPresent() {
        
        let testString = "dsffaslhdas_Substring_jdskfds"
        let substring = "Substring"
        XCTAssertTrue(testString.contains(subString: substring))
    }
    
    func testContainsReturnsFalseWhenSubstringIsPresent() {
        
        let testString = "sdjfkjhfhonjkvjdshfjkdjkf"
        let substring = "Substring"
        XCTAssertFalse(testString.contains(subString: substring))
    }
    
}
