//
//  AppDelegate.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 30/01/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: CoordinatorProtocol?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let movie = Movie.init(id: 399566,
//                               title: "",
//                               poster_path: "",
//                               vote_average: 2,
//                               vote_count: 2,
//                               overview: "")
//
////        let moviesGalleryModule = MoviesGalleryRouter.buildModule()
//        let movieDetailModule = MovieDetailRouter.buildModule(movie)
//        let navigationController = UINavigationController(rootViewController: movieDetailModule)
        
        let navigationController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navigationController)
        coordinator?.showMoviesGallery(isRoot: true)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .systemRed
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

