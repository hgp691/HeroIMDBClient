//
//  MoviesGalleryViewProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 2/02/21.
//

import Foundation

public protocol MoviesGalleryViewProtocol: class {
    var presenter: MoviesGalleryPresenterProtocol? { get set }
    /// Function to reload the data
    func addData(movies: [MovieCellViewModel])
    /// Function to load empty status
    func showEmptyStatus()
}

