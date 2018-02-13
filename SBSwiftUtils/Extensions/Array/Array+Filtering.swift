//
//  Array+Filtering.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

public extension Array {
    
    mutating func filterInPlace(isIncluded: (Element) -> Bool) {
        self = self.filter(isIncluded)
    }
}
