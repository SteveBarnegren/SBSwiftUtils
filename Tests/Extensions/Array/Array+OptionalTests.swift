//
//  Array+OptionalTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest

class Array_OptionalTests: XCTestCase {
    
    func testFlattened() {
        
        let array: [Int?] = [0, 1, nil, 2, nil]
        XCTAssertEqual(array.flattened(), [0, 1, 2])
    }

}
