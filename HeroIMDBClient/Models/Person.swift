//
//  Person.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import Foundation

/// Objecto to represent a person inside the movie
public struct Person: Decodable {
    var id: Int
    var movieid: Int?
    var name: String
    var job: String?
    var profile_path: String?
    
    public init(id: Int, movieid: Int?, name: String, job: String?, profile_path: String?) {
        self.id = id
        self.movieid = movieid
        self.name = name
        self.job = job
        self.profile_path = profile_path
    }
}
