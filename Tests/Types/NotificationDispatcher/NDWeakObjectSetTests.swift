//
//  NDWeakObjectSetTests.swift
//  SBSwiftUtilsTests
//
//  Created by Steve Barnegren on 06/06/2020.
//  Copyright © 2020 SteveBarnegren. All rights reserved.
//

import XCTest
@testable import SBSwiftUtils

private class SetItem {
    let value: String
    
    init(_ value: String) {
        self.value = value
    }
}

class WeakObjectSetTests: XCTestCase {

    // MARK: - Insert
    
    func test_InsertObject() {
        
        let item = SetItem("a")
        
        var set = NDWeakObjectSet<SetItem>()
        set.insert(object: item)
        
        XCTAssertEqual(set.count, 1)
    }
    
    func test_InsertMultipleObjects() {
        
        let itemA = SetItem("a")
        let itemB = SetItem("a")

        var set = NDWeakObjectSet<SetItem>()
        set.insert(object: itemA)
        set.insert(object: itemB)

        XCTAssertEqual(set.count, 2)
    }
    
    func test_CannotInsertSameObjectMultipleTimes() {
        
        let item = SetItem("a")

        var set = NDWeakObjectSet<SetItem>()
        set.insert(object: item)
        set.insert(object: item)
        set.insert(object: item)

        XCTAssertEqual(set.count, 1)
    }
    
    // MARK: - Test object deallocation
    
    func test_doesNotRetainObjects() {
        
        var strongItem: SetItem? = SetItem("a")
        weak var weakItem: SetItem? = strongItem
        
        var set = NDWeakObjectSet<SetItem>()
        set.insert(object: strongItem!)

        XCTAssertEqual(set.count, 1)
        XCTAssertNotNil(weakItem)
        
        strongItem = nil
        XCTAssertEqual(set.count, 0)
        XCTAssertNil(weakItem)
    }
}
