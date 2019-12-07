//
//  APIServices.swift
//  SecondSeminaStackView
//
//  Created by IJ . on 2019/11/02.
//  Copyright © 2019 jun. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case requestError(String)
    case pathError
    case serverError
    case networkError
}
