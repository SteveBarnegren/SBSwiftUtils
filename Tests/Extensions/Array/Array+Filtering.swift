//
//  Array+Filtering.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Array_Filtering: XCTestCase {
    
    // MARK: - Filter In Place
    
    func testFilterInPlace() {
        
        var array = ["a", "b", "c", "d"]
        array.filterInPlace { $0 != "c" }
        XCTAssertEqual(array, ["a", "b", "d"])
    }
    
    // MARK: - Remove
    
    func testRemoveDoesntRemoveNonMatchingItems() {
        
        var array = ["dog", "cat", "cow"]
        array.remove { $0 == "monkey" }
        XCTAssertEqual(array, ["dog", "cat", "cow"])
    }
    
    func testRemoveRemovesSingleMatchingItem() {
        
        var array = ["dog", "cat", "cow"]
        array.remove { $0 == "cat" }
        XCTAssertEqual(array, ["dog", "cow"])
    }
    
    func testRemoveRemovesMultipleMatchingItems() {
        
        var array = ["dog", "cat", "cow", "cat", "sheep"]
        array.remove { $0 == "cat" }
        XCTAssertEqual(array, ["dog", "cow", "sheep"])
    }

}
