//
//  Collection+ExtensionsTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Collection_ExtensionsTests: XCTestCase {
    
    // MARK: - Last Index
    
    func testLastIndex() {
        
        XCTAssertNil([Int]().lastIndex)
        XCTAssertEqual([0].lastIndex, 0)
        XCTAssertEqual([0, 0].lastIndex, 1)
        XCTAssertEqual([0, 0, 0].lastIndex, 2)
    }

    // MARK: - is Ascending / Descending
    
    func testIsAscending() {
        
        XCTAssertTrue([1, 2, 3, 4, 5].isAscending)
        XCTAssertTrue([1, 2, 3, 3, 4, 4, 5].isAscending)
        XCTAssertTrue([1, 1, 1, 1, 1].isAscending)
        XCTAssertFalse([1, 4, 2, 1, 5].isAscending)
    }
    
    func testIsDescending() {
        
        XCTAssertTrue([5, 4, 3, 2, 1].isDescending)
        XCTAssertTrue([5, 4, 3, 3, 2, 2, 1].isDescending)
        XCTAssertTrue([1, 1, 1, 1, 1].isDescending)
        XCTAssertFalse([5, 2, 4, 5, 1].isDescending)
    }
    
}
