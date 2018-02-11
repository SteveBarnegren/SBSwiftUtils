//
//  Array+InsertionTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Array_InsertionTests: XCTestCase {
    
    // MARK: - Prepend
    
    func testPrepend() {
        
        var array = ["e", "l", "l", "o"]
        array.prepend("h")
        XCTAssertEqual(array, ["h", "e", "l", "l", "o"])
        
        var emptyArray = [String]()
        emptyArray.prepend("a")
        XCTAssertEqual(emptyArray, ["a"])
    }
    
    func testPrependContentsOf() {
        
        var array = ["l", "l", "o"]
        array.prepend(contentsOf: ["h", "e"])
        XCTAssertEqual(array, ["h", "e", "l", "l", "o"])
        
        var emptyArray = [String]()
        emptyArray.prepend(contentsOf: ["h", "e", "l", "l", "o"])
        XCTAssertEqual(emptyArray, ["h", "e", "l", "l", "o"])
    }
    
    // MARK: - Prepending

    func testPrepending() {
        
        let array = ["e", "l", "l", "o"]
        XCTAssertEqual(array.prepending("h"), ["h", "e", "l", "l", "o"])
        
        let emptyArray = [String]()
        XCTAssertEqual(emptyArray.prepending("a"), ["a"])
    }
    
    func testPrependingContentsOf() {
        
        let array = ["l", "l", "o"]
        XCTAssertEqual(array.prepending(contentsOf: ["h", "e"]), ["h", "e", "l", "l", "o"])
        
        let emptyArray = [String]()
        XCTAssertEqual(emptyArray.prepending(contentsOf: ["h", "e", "l", "l", "o"]), ["h", "e", "l", "l", "o"])
    }
    
    // MARK: - Appending
    
    func testAppending() {
        
        let array = ["d", "o"]
        XCTAssertEqual(array.appending("g"), ["d", "o", "g"])
        
        let emptyArray = [String]()
        XCTAssertEqual(emptyArray.appending("a"), ["a"])
    }
    
    func testAppendingContentsOf() {
        
        let array = ["h", "e"]
        XCTAssertEqual(array.appending(contentsOf: ["l", "l", "o"]), ["h", "e", "l", "l", "o"])
        
        let emptyArray = [String]()
        XCTAssertEqual(emptyArray.appending(contentsOf: ["d", "o", "g"]), ["d", "o", "g"])
    }

}
