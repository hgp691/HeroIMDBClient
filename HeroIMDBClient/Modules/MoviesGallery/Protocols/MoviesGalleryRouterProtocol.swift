//
//  MoviesGalleryRouterProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 3/02/21.
//

import UIKit

public protocol MoviesGalleryRouterProtocol: class {
    
    /// Function to allow presenting AlertControllers
    /// - Parameter message: The message for the UIAlertController
    /// - Parameter completion: The completion if needed
    func presentAlert(message: String, completion: (() -> Void)?)
    /// Function to present the Detail Module
    /// - Parameter movie: The Movie to load in detail
    func pushDetailModule(with movie: Movie)
    /// Function used to build the current module
    static func buildModule() -> UIViewController
}
