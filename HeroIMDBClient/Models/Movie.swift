//
//  Movie.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

/// Object to represent a Movie
public struct Movie: Decodable {
    
    var id: Int
    var title: String
    var poster_path: String
    var vote_average: Double
    var vote_count: Double
    var overview: String
}
