//
//  ImageButtonCellViewModelTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import XCTest
@testable import HeroIMDBClient

class ImageButtonCellViewModelTests: XCTestCase {
    
    var viewModel: ImageButtonCellViewModel!
    var movie: Movie!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movie = Movie.getMockMovie(id: 1)
        viewModel = ImageButtonCellViewModel(movie)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        movie = nil
    }
    
    func test_ImageButtonCellViewModel_url() {
        // Given
        let expectedURL = "https://image.tmdb.org/t/p/w500poster_path"
        // Then
        XCTAssertEqual(expectedURL, viewModel.imageURL?.absoluteString, "The url must be the same")
    }

    func test_ImageButtonCellViewModel_shouldShowButton() {
        XCTAssertTrue(viewModel.shouldShowButton, "The viewmodel should show button for now")
    }
}
