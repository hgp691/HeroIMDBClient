//
//  MovieDatabaseWrapper.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 1/02/21.
//

import XCTest
@testable import HeroIMDBClient

class MovieDatabaseWrapperTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_MovieDatabaseWrapper_mustBeNil_withMovieAndMovieDBNIL() {
        // When
        let dataWrapper = MovieDatabaseWrapper()
        // Then
        XCTAssertNil(dataWrapper.getMovie(), "The Movie must be nil")
        XCTAssertNil(dataWrapper.getMovieDB(), "The MovieDB must be nil")
    }
    
    func test_MovieDatabaseWrapper_mustReturnTheSameMovie() {
        // Given
        let movie = Movie.getMockMovie(id: 1)
        // When
        let dataBaseWrapper = MovieDatabaseWrapper(movie)
        // Then
        XCTAssertEqual(movie.id, dataBaseWrapper.getMovie()?.id, "The objects must be the same")
    }
}
