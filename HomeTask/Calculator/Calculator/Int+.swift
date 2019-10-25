//
//  Int+.swift
//  Calculator
//
//  Created by IJ . on 2019/10/25.
//  Copyright © 2019 jun. All rights reserved.
//

import Foundation

extension Int {
    var withComma: String {
        let format = NumberFormatter()
        format.numberStyle = .decimal
        return format.string(from: self as NSNumber) ?? ""
        // a ?? b
        // a != nil ? a! : b
    }
}
