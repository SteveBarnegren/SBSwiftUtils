//
//  Array+AccessorsTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Array_AccessorsTests: XCTestCase {
    
    // MARK: - Pop First
    
    func testPopFirstReturnsNilForEmptyArray() {
        
        var array = [Int]()
        XCTAssertNil(array.popFirst())
    }
    
    func testPopFirstRemovesAndReturnsFirstItem() {
        
        var array = [1, 2, 3, 4, 5]
        let first = array.popFirst()
        XCTAssertEqual(array, [2, 3, 4, 5])
        XCTAssertEqual(first, 1)
    }
}
