//
//  MoviesGalleryInteractorProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 2/02/21.
//

import Foundation

public protocol MoviesGalleryInteractorProtocol: class {
    
    var output: MoviesGalleryOutputProtocol? { get set }
    var dataManager: DataManagerProtocol { get set }
    /// Function that retrieve a page of Movies
    func getMoviesPage(page: Int)
}
