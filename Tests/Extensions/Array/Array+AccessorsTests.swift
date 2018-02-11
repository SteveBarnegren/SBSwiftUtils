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
    
    // MARK: - Maybe Subscript
    
    func testMaybeSubscriptWithEmptyArray() {
        
        let array = [Int]()
        XCTAssertNil(array[maybe: -1])
        XCTAssertNil(array[maybe: 0])
        XCTAssertNil(array[maybe: 1])
    }
    
    func testMaybeSubscriptWithPopulatedArray() {
        
        let array = ["cat", "dog", "monkey"]
        XCTAssertNil(array[maybe: -1])
        XCTAssertEqual(array[maybe: 0], "cat")
        XCTAssertEqual(array[maybe: 1], "dog")
        XCTAssertEqual(array[maybe: 2], "monkey")
        XCTAssertNil(array[maybe: 3])
    }
}
