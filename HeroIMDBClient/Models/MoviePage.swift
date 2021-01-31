//
//  MoviePage.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

/// Object to represent a Movie Page
public struct MoviePage: Decodable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
    var total_results: Int
}
