//
//  MoviesGalleryRouterTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import XCTest
@testable import HeroIMDBClient

class MoviesGalleryRouterTests: XCTestCase {
    
    var router: MoviesGalleryRouter!
    var coordinator: MockCoordinatorForGalleryRouter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        coordinator = MockCoordinatorForGalleryRouter()
        router = MoviesGalleryRouter()
        router.coordinator = coordinator
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MoviesGalleryRouter_pushDetailModuleCalled() {
        // Given
        let movie = Movie.getMockMovie(id: 1)
        // When
        router.pushDetailModule(with: movie)
        // Then
        XCTAssertTrue(coordinator.didCalledShowMovieDetail, "the method should be called")
    }
    
    func test_MoviesGalleryRouter_showAlert() {
        // Given
        let expectation = XCTestExpectation(description: "Expectation for MoviesGalleryRouter")
        let completion = {
            // Then
            XCTAssertTrue(true, "the closure must be called")
            expectation.fulfill()
        }
        // When
        router.presentAlert(message: "", completion: completion)
        wait(for: [expectation], timeout: 10.0)
    }
}
