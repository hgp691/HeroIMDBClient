//
//  MovieStorageProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 31/01/21.
//

import Foundation

public protocol MovieStorageProtocol {
    /// Save a MoviePage
    ///- Parameter moviePage: The page to be saved
    func save(moviePage: MoviePage)
    /// Save a Movie
    /// - Parameter movie: The Movie to be saved
    func save(movie: Movie)
    /// Retrive Movie
    func retrieve(movie id: Int) -> Movie?
    /// Retrieve all movies
    func retrieveAllMovies() -> [Movie]
    /// Retrieve Movies from a page
    func retrieveAllMovies(_ page: Int) -> [Movie]
}
