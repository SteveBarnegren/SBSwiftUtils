//
//  Array+SortingTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Array_SortingTests: XCTestCase {

    // MARK: - Sorted Ascending / Descending
    
    func testSortedAscendingSortsAscending() {
        
        let array = [5, 2, 3, 1, 4]
        XCTAssertEqual(array.sortedAscending(), [1, 2, 3, 4, 5])
    }
    
    func testSortedDescendingSortsDescending() {
        
        let array = [5, 2, 3, 1, 4]
        XCTAssertEqual(array.sortedDescending(), [5, 4, 3, 2, 1])
    }
    
    func testSortAscendingSortsAscending() {
        
        var array = [5, 2, 3, 1, 4]
        array.sortAscending()
        XCTAssertEqual(array, [1, 2, 3, 4, 5])
    }
    
    func testSortDescendingSortsDescending() {
        
        var array = [5, 2, 3, 1, 4]
        array.sortDescending()
        XCTAssertEqual(array, [5, 4, 3, 2, 1])
    }
    
}
