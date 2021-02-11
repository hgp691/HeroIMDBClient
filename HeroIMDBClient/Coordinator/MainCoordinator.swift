//
//  MainCoordinator.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 10/02/21.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showMoviesGallery(isRoot: Bool) {
        let view = MoviesGalleryRouter.buildModule(with: self)
        if isRoot {
            putAsRoot(viewController: view)
        } else {
            push(viewController: view)
        }
    }
    
    func showMovieDetail(isRoot: Bool, movie: Movie) {
        let view = MovieDetailRouter.buildModule(movie, self)
        if isRoot {
            putAsRoot(viewController: view)
        } else {
            push(viewController: view)
        }
    }
    
    func showAlert(_ message: String, completion: (() -> Void)?) {
        
    }
    
    private func putAsRoot(viewController: UIViewController) {
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func push(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
}
