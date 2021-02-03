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
        if let movie = self.storage.retrieve(movie: movieId) {
            onSucced?(movie)
        } else {
            let route = NetworkRoute.getMovie(movieId)
            networkProvider.requestGET(route) { (result: Result<Movie, NetworkError>) in
                switch result {
                    case .success(let movie):
                        self.storage.save(movie: movie)
                        onSucced?(movie)
                    case .failure(let error):
                        onError?(error)
                }
            }
        }
        
    }
}
