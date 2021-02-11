//
//  MockDataManagerForInteractor.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation
import HeroIMDBClient

class MockDataManagerForInteractor: DataManagerProtocol {
    
    var movieToReturn: Movie
    var errorToReturn: Error
    
    var shouldReturnMovie = false
    var shouldReturnError = false
    
    init(movieToReturn: Movie, errorToReturn: Error) {
        self.movieToReturn = movieToReturn
        self.errorToReturn = errorToReturn
    }
    
    func getAPage(page: Int, onSucced: (([Movie]) -> Void)?, onError: ((Error) -> Void)?) { }
    
    func getAMovie(movieId: Int, onSucced: ((Movie) -> Void)?, onError: ((Error) -> Void)?) {
        if shouldReturnMovie {
            onSucced?(movieToReturn)
        } else if shouldReturnError {
            onError?(errorToReturn)
        }
    }
}
