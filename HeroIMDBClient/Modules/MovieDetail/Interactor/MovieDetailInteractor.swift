//
//  MovieDetailInteractor.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 8/02/21.
//

import Foundation

class MovieDetailInteractor: MovieDetailInteractorProtocol {
    
    weak var output: MovieDetailOutputProtocol?
    var dataManager: DataManagerProtocol
    private(set) var movie: Movie
    
    init(dataManager: DataManagerProtocol,
         movie: Movie) {
        self.dataManager = dataManager
        self.movie = movie
    }
    
    func loadMovie() {
        dataManager.getAMovie(movieId: movie.id) { [weak self] (movie) in
            self?.movie = movie
            self?.output?.didLoadedMovie()
        } onError: { [weak self] (error) in
            self?.output?.didLoadedMovieFailed(error: error)
        }
    }
}
