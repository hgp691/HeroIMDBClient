//
//  MoviesGalleryRouter.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 4/02/21.
//

import UIKit

public class MoviesGalleryRouter: MoviesGalleryRouterProtocol {
    
    init() { }
    
    public func presentAlert(message: String, completion: (() -> Void)?) {
        
    }
    
    public func pushDetailModule(with movie: Movie) {
        
    }
    
    public static func buildModule() -> UIViewController {
        /// View
        guard let view = MoviesGalleryViewController.instantiate() else {
            return UIViewController()
        }
        /// Interactor
        let networkProvider = NetworkProvider()
        let moviesStorage = MovieStorage(HeroDataStore())
        let dataManager = DataManager(networkProvider, moviesStorage)
        let interactor = MoviesGalleryInteractor(dataManager)
        /// Presenter
        let presenter = MoviesGalleryPresenter()
        /// Router
        let router = MoviesGalleryRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        
        return view
    }
}
