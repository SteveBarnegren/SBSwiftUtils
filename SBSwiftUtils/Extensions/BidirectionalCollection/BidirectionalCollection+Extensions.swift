//
//  BidirectionalCollection+Extensions.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

extension BidirectionalCollection {
    
    func toArray() -> [Element] {
        return Array(self)
    }
}
