//
//  MovieCellViewModelTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 7/02/21.
//

import XCTest
@testable import HeroIMDBClient

class MovieCellViewModelTests: XCTestCase {
    
    var viewModel: MovieCellViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let movie = Movie.getMockMovie(id: 1)
        viewModel = MovieCellViewModel(movie)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func test_MovieCellViewModel_url() {
        let expectedURL = "https://image.tmdb.org/t/p/w300poster_path"
        XCTAssertEqual(viewModel.imageURL?.absoluteString, expectedURL, "The url must be builded")
    }
    
    func test_MovieCellViewModel_equals() {
        let movie = Movie.getMockMovie(id: 1)
        let viewModel1 = MovieCellViewModel(movie)
        let viewModel2 = MovieCellViewModel(movie)
        XCTAssertEqual(viewModel1, viewModel2, "")
    }
    
    func test_MovieCellViewModel_hash() {
        var hash = Hasher()
        let movie = Movie.getMockMovie(id: 1)
        let viewModel1 = MovieCellViewModel(movie)
        viewModel1.hash(into: &hash)
    }
}
