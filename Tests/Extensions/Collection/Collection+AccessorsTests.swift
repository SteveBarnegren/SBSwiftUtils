//
//  Collection+AccessorsTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 18/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest

class Collection_AccessorsTests: XCTestCase {
    
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

    // MARK: - Throwing Accessor
    
    func testThrowingAccessor() {
        
        let array = ["a", "b", "c"]
        
        XCTAssertEqual(try array.at(throwing: 0), "a")
        XCTAssertEqual(try array.at(throwing: 1), "b")
        XCTAssertEqual(try array.at(throwing: 2), "c")
        
        do {
            _ = try array.at(throwing: 3)
            XCTFail("Should throw out of bounds error")
        } catch {}
    }

}
