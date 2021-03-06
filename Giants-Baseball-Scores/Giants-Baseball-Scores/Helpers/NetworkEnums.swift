//
//  NetworkEnums.swift
//  Giants-Baseball-Scores
//
//  Created by Joe Veverka on 7/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noData, badDecode
}

enum HTTPMethod: String {
    case get = "GET"
}
