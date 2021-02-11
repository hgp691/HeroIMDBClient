//
//  MovieDetailInteractorTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import XCTest
@testable import HeroIMDBClient

class MovieDetailInteractorTests: XCTestCase {
    
    var interactor: MovieDetailInteractor!
    var dataManager: MockDataManagerForInteractor!
    var movie: Movie!
    var output: MockOutputForInteractor!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let movie2 = Movie.getMockMovie(id: 90)
        movie = Movie.getMockMovie(id: 1)
        let error = NetworkError.badURL
        dataManager = MockDataManagerForInteractor(movieToReturn: movie2, errorToReturn: error)
        interactor = MovieDetailInteractor(dataManager: dataManager, movie: movie)
        output = MockOutputForInteractor()
        interactor.output = output
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movie = nil
        dataManager = nil
        movie = nil
        output = nil
    }
    
    func test_MovieDetailInteractor_loadedCalled_succed() {
        // Given
        dataManager.shouldReturnMovie = true
        // When
        interactor.loadMovie()
        // Then
        XCTAssertTrue(output.didLoadedMovieCalled, "The load must be called")
    }
    
    func test_MovieDetailInteractor_loadedCalled_failed() {
        // Given
        dataManager.shouldReturnError = true
        // When
        interactor.loadMovie()
        // Then
        XCTAssertNotNil(output.didLoadedMovieFailedError, "There must be an error")
    }
}
