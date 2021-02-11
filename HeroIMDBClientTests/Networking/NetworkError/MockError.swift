//
//  MockError.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 31/01/21.
//

import Foundation

enum MockError: Error {
    case test(String)
}

extension MockError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .test(let message):
                return message
        }
    }
}
