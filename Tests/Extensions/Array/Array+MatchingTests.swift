//
//  Array+MatchingTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Array_MatchingTests: XCTestCase {

    // MARK: - All Match
    
    func testAllMatchReturnsFalseForEmptyArray() {
        
        let array = [Int]()
        XCTAssertFalse(array.allMatch { $0 == 10 })
    }
    
    func testAllMatchReturnsFalseWhenNoMatchingElements() {
        
        let array = [0, 1, 2, 3, 4, 5]
        XCTAssertFalse(array.allMatch { $0 == 10 })
    }
    
    func testAllMatchReturnsFalseWhenSomeMatchingElements() {
        
        let array = [0, 1, 2, 3, 4, 5]
        XCTAssertFalse(array.allMatch { $0 < 2 })
    }
    
    func testAllMatchReturnsTrueWhenAllElementsMatch() {
        
        let array = [0, 1, 2, 3, 4, 5]
        XCTAssertFalse(array.allMatch { $0 <= 0 })
    }

}
