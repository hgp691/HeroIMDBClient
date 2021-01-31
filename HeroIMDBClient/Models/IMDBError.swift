//
//  IMDBError.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 31/01/21.
//

import Foundation

/// Error sent by the IMDB service
public struct IMDBError: Decodable {
    var errors: [String]
}
