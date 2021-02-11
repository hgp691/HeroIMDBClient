//
//  MovieDetailrouter.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 8/02/21.
//

import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    
    var coordinator: CoordinatorProtocol?
    
    static func buildModule(_ movie: Movie, _ coordinator: CoordinatorProtocol? = nil) -> UIViewController {
        // View
        guard let view = MovieDetailViewController.instantiate() else {
            return UIViewController()
        }
        // Interactor
        let networkProvider = NetworkProvider()
        let store = HeroDataStore()
        let storage = MovieStorage(store)
        let dataManager = DataManager(networkProvider, storage)
        let interactor = MovieDetailInteractor(dataManager: dataManager, movie: movie)
        // Presenter
        let presenter = MovieDetailPresenter()
        // Router
        let router = MovieDetailRouter()
        router.coordinator = coordinator
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.output = presenter
        
        return view
    }
}
