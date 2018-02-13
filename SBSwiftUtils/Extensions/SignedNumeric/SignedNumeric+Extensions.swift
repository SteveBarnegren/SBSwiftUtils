//
//  SignedNumeric+Extensions.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

public extension SignedNumeric where Self: Comparable {
    
    var abs: Self {
        return Swift.abs(self)
    }
    
    func absDistance(to other: Self) -> Self {
        return Swift.abs(self - other)
    }
}
