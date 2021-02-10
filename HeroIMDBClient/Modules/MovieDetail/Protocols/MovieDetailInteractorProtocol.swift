//
//  MovieDetailInteractorProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 7/02/21.
//

import Foundation

public protocol MovieDetailInteractorProtocol: class {
    
    var output: MovieDetailOutputProtocol? { get set }
    var dataManager: DataManagerProtocol { get set }
    /// Function that load a  Movie
    func loadMovie()
    /// Loaded Movie
    var movie: Movie { get }
}
