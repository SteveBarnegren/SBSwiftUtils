//
//  FreeFunctions.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

public func repeated(times: Int, handler: () -> Void) {
    assert(times > 0, "Times must be greater than zero")
    
    for _ in (0..<times) {
        handler()
    }
}
