//
//  Optional+Extensions.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

public extension Optional {
    
    func require(_ errorMessage: String) -> Wrapped {
        
        switch self {
        case .none:
            fatalError(errorMessage)
        case .some(let obj):
            return obj
        }
    }
}
