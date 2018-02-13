//
//  FreeFunctionsTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import XCTest
import SBSwiftUtils

class FreeFunctionsTests: XCTestCase {

    // MARK: - Repeated
    
    func testRepeatedFunctionRunsHandlerOnce() {
        
        var timesRun = 0
        
        repeated(times: 1) {
            timesRun += 1
        }
        
        XCTAssertEqual(timesRun, 1)
    }
    
    func testRepeatedFunctionRunsHandlerMultipleTimes() {
        
        var timesRun = 0
        
        repeated(times: 10) {
            timesRun += 1
        }
        
        XCTAssertEqual(timesRun, 10)
    }

}
