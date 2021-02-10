//
//  CoordinatorProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation

public protocol CoordinatorProtocol {
    
    /// Function to show the Movies Gallery
    func showMoviesGallery(isRoot: Bool)
    
    /// Function to show the Movie Detail
    func showMovieDetail(isRoot: Bool, movie: Movie)
}
