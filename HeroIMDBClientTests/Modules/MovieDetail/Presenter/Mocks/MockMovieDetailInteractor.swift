//
//  MockMovieDetailInteractor.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation
import HeroIMDBClient

class MockMovieDetailInteractor: MovieDetailInteractorProtocol {
    
    var output: MovieDetailOutputProtocol?
    var dataManager: DataManagerProtocol
    var movie: Movie = Movie.getMockMovie(id: 1)
    var didCalledLoadMovie = false
    
    init(dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func loadMovie() {
        didCalledLoadMovie = true
    }
    
    
}
