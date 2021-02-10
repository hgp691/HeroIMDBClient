//
//  DataManager.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 2/02/21.
//

import Foundation

public struct DataManager: DataManagerProtocol {
    
    let networkProvider: NetworkProviderProtocol
    let storage: MovieStorageProtocol
    
    public init(_ networkProvider: NetworkProviderProtocol,
                _ storage: MovieStorageProtocol) {
        self.networkProvider = networkProvider
        self.storage = storage
    }
    
    public func getAPage(page: Int,
                         onSucced: (([Movie]) -> Void)?,
                         onError: ((Error) -> Void)?) {
        
        let route = NetworkRoute.getPopularMoviesPage(page)
        networkProvider.requestGET(route) { (result: Result<MoviePage, NetworkError>) in
            switch result {
            case .success(let moviePage):
                self.storage.save(moviePage: moviePage)
                onSucced?(moviePage.results)
            case .failure(let error):
                let moviesSaved = self.storage.retrieveAllMovies(page)
                if !moviesSaved.isEmpty {
                    onSucced?(moviesSaved)
                } else {
                    onError?(error)
                }
            }
        }
    }
    
    public func getAMovie(movieId: Int,
                          onSucced: ((Movie) -> Void)?,
                          onError: ((Error) -> Void)?) {
        
        var loadedMovie: Movie?
        var loadedError: Error?
        
        let getMovieGroup = DispatchGroup()
        
        let routeLoadMovie = NetworkRoute.getMovie(movieId)
        getMovieGroup.enter()
        networkProvider.requestGET(routeLoadMovie) { (result: Result<Movie, NetworkError>) in
            switch result {
                case .success(let movie):
                    self.storage.save(movie: movie)
                    loadedMovie = movie
                    getMovieGroup.leave()
                case .failure(let error):
                    loadedError = error
                    getMovieGroup.leave()
            }
        }
        
        let routeGetCredits = NetworkRoute.getCredits(movieId)
        
        var loadedCredits: Credits?
        
        getMovieGroup.enter()
        networkProvider.requestGET(routeGetCredits) { (result: Result<Credits, NetworkError>) in
            switch result {
                case .success(let credits):
                    loadedCredits = credits
                    getMovieGroup.leave()
                case .failure(let error):
                    loadedError = error
                    getMovieGroup.leave()
            }
        }
        
        getMovieGroup.notify(queue: .global()) {
            if var loadedMovieStrong = loadedMovie {
                loadedMovieStrong.cast = loadedCredits?.cast
                loadedMovieStrong.crew = loadedCredits?.crew
                onSucced?(loadedMovieStrong)
            } else if var movie = self.storage.retrieve(movie: movieId) {
                movie.cast = loadedCredits?.cast
                movie.crew = loadedCredits?.crew
                onSucced?(movie)
            } else if let error = loadedError {
                onError?(error)
            }
        }
    }
}
