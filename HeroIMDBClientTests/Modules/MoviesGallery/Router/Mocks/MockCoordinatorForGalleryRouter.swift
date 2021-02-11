//
//  MockCoordinatorForGalleryRouter.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation
import HeroIMDBClient

class MockCoordinatorForGalleryRouter: CoordinatorProtocol {
    
    var showMovieDetail = false
    var didCalledShowMovieDetail = false
    
    func showMoviesGallery(isRoot: Bool) {
        showMovieDetail = true
    }
    
    func showMovieDetail(isRoot: Bool, movie: Movie) {
        didCalledShowMovieDetail = true
    }
    
    func showAlert(_ message: String, completion: (() -> Void)?) {
        completion?()
    }
}
