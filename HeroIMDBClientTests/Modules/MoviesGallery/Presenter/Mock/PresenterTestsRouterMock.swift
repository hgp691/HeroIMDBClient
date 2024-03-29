//
//  PresenterTestsRouterMock.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 6/02/21.
//

import Foundation
import UIKit
import HeroIMDBClient

class PresenterTestsRouterMock: MoviesGalleryRouterProtocol {
    
    var coordinator: CoordinatorProtocol?
    var pushWithMovie: Movie?
    var didPresentAlert: Bool = false
    
    func presentAlert(message: String, completion: (() -> Void)?) {
        didPresentAlert = true
    }
    
    func pushDetailModule(with movie: Movie) {
        pushWithMovie = movie
    }
    
    static func buildModule(with coordinator: CoordinatorProtocol?) -> UIViewController {
        return UIViewController()
    }
}
