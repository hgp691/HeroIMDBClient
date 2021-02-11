//
//  CoordinatorProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation

public protocol CoordinatorProtocol {
    
    /// Function to show the Movies Gallery
    /// - Parameter isRoot: Determines if the ViewController must be pushed or replaced the current one
    func showMoviesGallery(isRoot: Bool)
    
    /// Function to show the Movie Detail
    /// - Parameter isRoot: Determines if the ViewController must be pushed or replaced the current one
    /// - Parameter movie: the Movie to be showed on the detail
    func showMovieDetail(isRoot: Bool, movie: Movie)
    
    /// Function that allows to show an Alert
    /// - Parameter message: The message for the AlertBody
    /// - Parameter completion: The closure to be called when the user clicks on the accept button
    func showAlert(_ message: String, completion: (() -> Void)?)
}
