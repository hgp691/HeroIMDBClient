//
//  MoviesGalleryPresenterProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 2/02/21.
//

import Foundation

public protocol MoviesGalleryPresenterProtocol: class {
    
    var view: MoviesGalleryViewProtocol? { get set }
    var interactor: MoviesGalleryInteractorProtocol? { get set }
    var router: MoviesGalleryRouterProtocol? { get set }
    
    var lastCellIndex: Int { get }
    
    /// Array of ViewModels
    var viewModels: [MovieCellViewModel] { get }
    /// Function that must be called by the view once the ViewDidLoad
    func viewDidLoad()
    /// Function to load the next page
    func loadNextPage()
    /// Function called when the user select a Movie
    /// - Parameter index: The index Selected
    func didSelectMovie(at index: Int)
}

/// Protocol that can be seen by the Interactor in order to isolate the view
public protocol MoviesGalleryOutputProtocol: class {
    
    /// Function called by the Interactor when the page was loaded
    /// - Parameter page: The page number
    /// - Parameter movies: The array of movies of the page
    func didLoadPage(page: Int, movies: [Movie])
    /// Function called by the Interactor when the page atempt to load fails
    /// - Parameter page: The page number
    /// - Parameter error: The error for the atempt
    func didFailLoadingPage(page: Int, error: Error)
}
