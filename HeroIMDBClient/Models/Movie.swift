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
    
    public init(id: Int, title: String, poster_path: String, vote_average: Double, vote_count: Double, overview: String) {
        self.id = id
        self.title = title
        self.poster_path = poster_path
        self.vote_average = vote_average
        self.vote_count = vote_count
        self.overview = overview
    }
    
//    public init(movieDB: MovieDB) {
//        self.id = Int(movieDB.id)
//        self.title = movieDB.title ?? String()
//        self.poster_path = movieDB.poster_path ?? String()
//        self.vote_average = movieDB.vote_average
//        self.vote_count = movieDB.vote_count
//        self.overview = movieDB.overview ?? String()
//    }
}
