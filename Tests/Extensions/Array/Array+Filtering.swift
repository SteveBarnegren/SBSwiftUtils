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
    
    func testFilterInPlace() {
        
        var array = ["a", "b", "c", "d"]
        array.filterInPlace { $0 != "c" }
        XCTAssertEqual(array, ["a", "b", "d"])
    }

}
