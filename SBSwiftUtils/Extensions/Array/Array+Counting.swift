//
//  Array+Counting.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

public extension Array {
    
    func count(where matches: (Element) -> Bool) -> Int {
        var count = 0
        for element in self where matches(element) {
            count += 1
        }
        return count
    }
    
}
