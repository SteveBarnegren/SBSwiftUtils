//
//  Array+SortByStepsTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest

class Array_SortByStepsTests: XCTestCase {
    
    func testSortByStepsWithNoStepsDoesntChangeItemOrder() {
        
        let array = [2, 3, 1, 5, 4]
        var sortedArray = array
        sortedArray.sortBySteps([])
        XCTAssertEqual(array, sortedArray)
    }
    
    func testSortByStepsOnEmptyArrayReturnsEmptyArray() {
        
        var array = [Int]()
        array.sortBySteps(
            Array.SortStep<Int>(ascending: { $0 })
        )
        XCTAssertTrue(array.isEmpty)
    }
    
    func testSortStepAscending() {
        
        var array = [2, 3, 1, 5, 4]
        array.sortBySteps(
            Array.SortStep(ascending: { $0 })
        )
        XCTAssertEqual(array, [1, 2, 3, 4, 5])
    }
    
    func testSortStepAscendingWithIdenticalValues() {
        
        var array = [2, 1, 3, 3, 2, 3]
        array.sortBySteps(
            Array.SortStep(ascending: { $0 })
        )
        XCTAssertEqual(array, [1, 2, 2, 3, 3, 3])
    }
    
    func testSortStepDescending() {
        
        var array = [2, 3, 1, 5, 4]
        array.sortBySteps(
            Array.SortStep(descending: { $0 })
        )
        XCTAssertEqual(array, [5, 4, 3, 2, 1])
    }
    
    func testSortStepDescendingWithIdenticalValues() {
        
        var array = [2, 1, 3, 3, 2, 3]
        array.sortBySteps(
            Array.SortStep(descending: { $0 })
        )
        XCTAssertEqual(array, [3, 3, 3, 2, 2, 1])
    }
    
    func testMultipleSortSteps() {
        
        do {
            var array = ["3b", "1a", "2a", "2b", "1b", "3c", "3a", "1c", "2c"]
            array.sortBySteps(
                Array.SortStep(ascending: { $0[$0.startIndex] }),
                Array.SortStep(ascending: { $0[$0.index($0.startIndex, offsetBy: 1)]})
            )
            XCTAssertEqual(array, ["1a", "1b", "1c", "2a", "2b", "2c", "3a", "3b", "3c"])
        }
        
        do {
            var array = ["3b", "1a", "2a", "2b", "1b", "3c", "3a", "1c", "2c"]
            array.sortBySteps(
                Array.SortStep(ascending: { $0[$0.startIndex] }),
                Array.SortStep(descending: { $0[$0.index($0.startIndex, offsetBy: 1)]})
            )
            XCTAssertEqual(array, ["1c", "1b", "1a", "2c", "2b", "2a", "3c", "3b", "3a"])
        }
        
        do {
            var array = ["3b", "1a", "2a", "2b", "1b", "3c", "3a", "1c", "2c"]
            array.sortBySteps(
                Array.SortStep(descending: { $0[$0.startIndex] }),
                Array.SortStep(ascending: { $0[$0.index($0.startIndex, offsetBy: 1)]})
            )
            XCTAssertEqual(array, ["3a", "3b", "3c", "2a", "2b", "2c", "1a", "1b", "1c"])
        }
    }
    
    // MARK: - Sorted by steps
    
    func testSortedBySteps() {
        
        let array = [2, 3, 1, 5, 4]
        let sortedArray = array.sortedBySteps(
            Array.SortStep(ascending: { $0 })
        )
        XCTAssertEqual(sortedArray, [1, 2, 3, 4, 5])
    }

}
