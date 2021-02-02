//
//  Movie+Ext.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 31/01/21.
//

import Foundation
import HeroIMDBClient

extension Movie {
    
    static func getMockMovie(id: Int) -> Movie {
        let id = id
        let title = "Title"
        let poster_path = "poster_path"
        let vote_average = 50.0
        let vote_count = 1245.0
        let overview = "Overview"
        
        let movie = Movie(id: id,
                          title: title,
                          poster_path: poster_path,
                          vote_average: vote_average,
                          vote_count: vote_count,
                          overview: overview,
                          page: 1)
        return movie
    }
    
    static func getMockMovie(id: Int, page: Int) -> Movie {
        let id = id
        let title = "Title"
        let poster_path = "poster_path"
        let vote_average = 50.0
        let vote_count = 1245.0
        let overview = "Overview"
        
        let movie = Movie(id: id,
                          title: title,
                          poster_path: poster_path,
                          vote_average: vote_average,
                          vote_count: vote_count,
                          overview: overview,
                          page: page)
        return movie
    }
}
