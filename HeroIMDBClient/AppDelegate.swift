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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let moviesGalleryModule = MoviesGalleryRouter.buildModule()
        let navigationController = UINavigationController(rootViewController: moviesGalleryModule)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = .systemRed
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

