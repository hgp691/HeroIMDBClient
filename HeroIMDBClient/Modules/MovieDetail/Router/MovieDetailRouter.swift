//
//  MovieDetailrouter.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 8/02/21.
//

import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    
    static func buildModule(_ movie: Movie) -> UIViewController {
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
        
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.view = view
        presenter.router = router
        
        interactor.output = presenter
        
        return view
    }
}
