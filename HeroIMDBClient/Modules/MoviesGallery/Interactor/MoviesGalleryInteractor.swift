//
//  MoviesGalleryInteractor.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 3/02/21.
//

import Foundation

public class MoviesGalleryInteractor: MoviesGalleryInteractorProtocol {
    
    public weak var output: MoviesGalleryOutputProtocol?
    public var dataManager: DataManagerProtocol
    
    public init(_ dataManager: DataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    public func getMoviesPage(page: Int) {
        dataManager.getAPage(page: page) { [weak self] (movies) in
            self?.output?.didLoadPage(page: page, movies: movies)
        } onError: { [weak self] (error) in
            self?.output?.didFailLoadingPage(page: page, error: error)
        }
    }
}
