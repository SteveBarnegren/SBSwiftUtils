//
//  Array+CountingTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class Array_CountingTests: XCTestCase {

    func testCountWhere() {
        
        let array = ["1", "2", "2", "3", "3", "3", "4", "4", "4", "4"]
        XCTAssertEqual(array.count { $0 == "0" }, 0)
        XCTAssertEqual(array.count { $0 == "1" }, 1)
        XCTAssertEqual(array.count { $0 == "2" }, 2)
        XCTAssertEqual(array.count { $0 == "3" }, 3)
        XCTAssertEqual(array.count { $0 == "4" }, 4)
    }

}
