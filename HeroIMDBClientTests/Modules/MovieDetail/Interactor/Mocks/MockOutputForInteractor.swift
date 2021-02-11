//
//  MockOutputForInteractor.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation
import HeroIMDBClient

class MockOutputForInteractor: MovieDetailOutputProtocol {
    
    var didLoadedMovieCalled = false
    var didLoadedMovieFailedError: Error?
    
    func didLoadedMovie() {
        didLoadedMovieCalled = true
    }
    
    func didLoadedMovieFailed(error: Error) {
        didLoadedMovieFailedError = error
    }
}
