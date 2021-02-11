//
//  MockMovieDetailDataManager.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation
import HeroIMDBClient

class MockMovieDetailDataManager: DataManagerProtocol {
    
    var movieToSend: Movie?
    var errorToSend: Error?
    
    init(movie: Movie?, error: Error?) {
        self.movieToSend = movie
        self.errorToSend = error
    }
    
    func getAPage(page: Int, onSucced: (([Movie]) -> Void)?, onError: ((Error) -> Void)?) {
        
    }
    
    func getAMovie(movieId: Int, onSucced: ((Movie) -> Void)?, onError: ((Error) -> Void)?) {
        if let movie = movieToSend {
            onSucced?(movie)
        } else if let error = errorToSend {
            onError?(error)
        }
    }
}
