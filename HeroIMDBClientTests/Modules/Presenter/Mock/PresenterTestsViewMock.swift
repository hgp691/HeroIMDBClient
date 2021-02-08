//
//  PresenterTestsViewMock.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 6/02/21.
//

import Foundation
import HeroIMDBClient

class PresenterTestsViewMock: MoviesGalleryViewProtocol {
    
    var presenter: MoviesGalleryPresenterProtocol?
    
    var didAddData = false
    var didShowEmptyStatus = false
    
    func addData(movies: [MovieCellViewModel]) {
        didAddData = true
    }
    
    func showEmptyStatus() {
        didShowEmptyStatus = true
    }
}
