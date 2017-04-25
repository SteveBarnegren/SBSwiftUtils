//
//  String+Extensions.swift
//  SBSwiftUtils
//
//  Created by Steven Barnegren on 25/04/2017.
//  Copyright © 2017 SteveBarnegren. All rights reserved.
//

import Foundation

extension String {
    
    var length: Int {
        return characters.count
    }
    
    func trimmed() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
