//
//  Array+Accessors.swift
//  SBSwiftUtils
//
//  Created by Steve Barnegren on 11/02/2018.
//  Copyright © 2018 SteveBarnegren. All rights reserved.
//

import Foundation

public extension Array {
    
    // MARK: - Maybe Subscript
    
    subscript(maybe index: Int) -> Element? {
        get {
            if index > count - 1 {
                return nil
            } else if index < 0 {
                return nil
            } else {
                return self[index]
            }
        }
    }
}
