//
//  PresenterTestsInteractorMock.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 6/02/21.
//

import Foundation
import HeroIMDBClient

struct PresenterTestsDataManagerMock: DataManagerProtocol {
    
    func getAPage(page: Int,
                  onSucced: (([Movie]) -> Void)?,
                  onError: ((Error) -> Void)?) { }
    
    func getAMovie(movieId: Int,
                   onSucced: ((Movie) -> Void)?,
                   onError: ((Error) -> Void)?) { }
    
    
}

class PresenterTestsInteractorMock: MoviesGalleryInteractorProtocol {
    
    var output: MoviesGalleryOutputProtocol?
    var dataManager: DataManagerProtocol = PresenterTestsDataManagerMock()
    
    var didCalledGetMoviesPage: Int?
    
    func getMoviesPage(page: Int) {
        didCalledGetMoviesPage = page
    }
}
