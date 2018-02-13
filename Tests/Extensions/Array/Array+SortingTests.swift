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
    
    // MARK: - Sorted Ascending / Descending By
    
    private struct IntWrapper {
        let value: Int
        
        static func == (lhs: IntWrapper, rhs: IntWrapper) -> Bool {
            return lhs.value == rhs.value
        }
    }
    
    func testSortedAscendingByKeySortsAscending() {
        
        let array = [IntWrapper(value: 5),
                     IntWrapper(value: 2),
                     IntWrapper(value: 3),
                     IntWrapper(value: 1),
                     IntWrapper(value: 4)]
        
        XCTAssertEqual(array.sortedAscendingBy { $0.value }.map {  $0.value }, [1, 2, 3, 4, 5])
    }
    
    func testSortedDescendingByKeySortsDescending() {
        
        let array = [IntWrapper(value: 5),
                     IntWrapper(value: 2),
                     IntWrapper(value: 3),
                     IntWrapper(value: 1),
                     IntWrapper(value: 4)]
        
        XCTAssertEqual(array.sortedDescendingBy { $0.value }.map { $0.value }, [5, 4, 3, 2, 1])
    }
    
    func testSortAscendingByKeySortsAscending() {
        
        var array = [IntWrapper(value: 5),
                     IntWrapper(value: 2),
                     IntWrapper(value: 3),
                     IntWrapper(value: 1),
                     IntWrapper(value: 4)]
        array.sortAscendingBy { $0.value }
        XCTAssertEqual(array.map { $0.value }, [1, 2, 3, 4, 5])
    }
    
    func testSortDescendingByKeySortsDescending() {
        
        var array = [IntWrapper(value: 5),
                     IntWrapper(value: 2),
                     IntWrapper(value: 3),
                     IntWrapper(value: 1),
                     IntWrapper(value: 4)]
        array.sortDescendingBy { $0.value }
        XCTAssertEqual(array.map { $0.value }, [5, 4, 3, 2, 1])
    }
    
    // MARK: - Bring To Front
    
    func testBringToFrontMovesSingleItemToFront() {
        
        var array = ["a", "b", "c", "d"]
        array.bringToFront { $0 == "c" }
        XCTAssertEqual(array, ["c", "a", "b", "d"])
    }
    
    func testBringToFrontLeavesAlreadyFrontItemAtFront() {
        
        var array = ["a", "b", "c", "d"]
        array.bringToFront { $0 == "a" }
        XCTAssertEqual(array, ["a", "b", "c", "d"])
    }
    
    func testBringToFrontBringsMultipleItemsToFront() {
        
        var array = ["a", "b", "c", "d", "c"]
        array.bringToFront { $0 == "c" }
        XCTAssertEqual(array, ["c", "c", "a", "b", "d"])
    }
    
    func testBringToFrontMaintainsItemsOrder() {
        
        var array = ["a", "b", "c1", "c2", "d", "c3"]
        array.bringToFront { $0.contains("c") }
        XCTAssertEqual(array, ["c1", "c2", "c3", "a", "b", "d"])
    }
    
    // MARK: - Send To Back
    
    func testSendToBackMovesSingleItemToBack() {
        
        var array = ["a", "b", "c", "d"]
        array.sendToBack { $0 == "c" }
        XCTAssertEqual(array, ["a", "b", "d", "c"])
    }
    
    func testSendToBackLeavesAlreadyLastItemAtBack() {
        
        var array = ["a", "b", "c", "d"]
        array.sendToBack { $0 == "d" }
        XCTAssertEqual(array, ["a", "b", "c", "d"])
    }
    
    func testSendToBackSendsMultipleItemsToBack() {
        
        var array = ["a", "b", "a", "c", "d"]
        array.sendToBack { $0 == "a" }
        XCTAssertEqual(array, ["b", "c", "d", "a", "a"])
    }
    
    func testSendToBackMaintainsItemsOrder() {
        
        var array = ["a", "b", "c1", "c2", "d", "c3"]
        array.sendToBack { $0.contains("c") }
        XCTAssertEqual(array, ["a", "b", "d", "c1", "c2", "c3"])
    }
    
}
