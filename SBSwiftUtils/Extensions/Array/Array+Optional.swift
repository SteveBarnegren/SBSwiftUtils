//
//  Array+Optional.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 13/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

public extension Array  {
    
    func flattened<T>() -> [T] where Element == Optional<T> {
        return flatMap { $0 }
    }
}

