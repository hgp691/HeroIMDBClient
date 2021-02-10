//
//  MovieDetailPresenterProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 7/02/21.
//

import Foundation

public protocol MovieDetailPresenterProtocol: class {
    
    var view: MovieDetailViewProtocol? { get set }
    var interactor: MovieDetailInteractorProtocol? { get set }
    var router: MovieDetailRouterProtocol? { get set }
    
    /// Function that must be called by the view once the ViewDidLoad
    func viewDidLoad()
    /// Register the cells if needed
    /// Count of cells
    var viewmodelsCount: Int { get }
    /// Get viewModel
    func getViewModel(at index: Int) -> TableViewCellViewModelProtocol
    /// Movie title
    var movieTitle: String { get }
}

/// Protocol that can be seen by the Interactor in order to isolate the view
public protocol MovieDetailOutputProtocol: class {
    /// The Movie was loaded
    func didLoadedMovie()
    /// The Movie load failed
    func didLoadedMovieFailed(error: Error)
}
