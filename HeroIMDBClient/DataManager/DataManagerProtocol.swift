//
//  DataManagerProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 2/02/21.
//

import Foundation

public protocol DataManagerProtocol {
    /// Function to retrieve a page
    /// - Parameter page: The number of the page to get
    /// - Parameter onSucced: Closure to handle succed
    /// - Parameter onError: Closure to handle Error
    func getAPage(
        page: Int,
        onSucced: (([Movie]) -> Void)?,
        onError: ((Error) -> Void)?
    )
    
    /// Function to retrieve a Movie
    /// - Parameter movieId: The id of the Movie to get
    /// - Parameter onSucced: Closure to handle succed
    /// - Parameter onError: Closure to handle Error
    func getAMovie(
        movieId: Int,
        onSucced: ((Movie) -> Void)?,
        onError: ((Error) -> Void)?
    )
}
