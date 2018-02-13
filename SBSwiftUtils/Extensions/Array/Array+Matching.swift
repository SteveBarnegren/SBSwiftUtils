//
//  Array+Matching.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

public extension Array {
    
    func allMatch(isMatching: (Element) -> Bool) -> Bool {
        
        if isEmpty {
            return false
        }
        
        for item in self {
            if isMatching(item) == false {
                return false
            }
        }
        
        return true
    }
}
