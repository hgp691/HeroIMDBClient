//
//  MovieTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 31/01/21.
//

import XCTest
import CoreData
@testable import HeroIMDBClient

class MovieTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Movie_InitWithParameters() {
        // Given
        let id = 1
        let title = "Title"
        let poster_path = "poster_path"
        let vote_average = 50.0
        let vote_count = 1245.0
        let overview = "Overview"
        let page = 1
        // When
        let movie = Movie(id: id,
                          title: title,
                          poster_path: poster_path,
                          vote_average: vote_average,
                          vote_count: vote_count,
                          overview: overview,
                          page: page)
        // Then
        XCTAssertNotNil(movie, "The initializer must work")
        XCTAssertEqual(movie.id, id, "The parameter must be setted")
        XCTAssertEqual(movie.title, title, "The parameter must be setted")
        XCTAssertEqual(movie.poster_path, poster_path, "The parameter must be setted")
        XCTAssertEqual(movie.vote_average, vote_average, "The parameter must be setted")
        XCTAssertEqual(movie.vote_count, vote_count, "The parameter must be setted")
        XCTAssertEqual(movie.overview, overview, "The parameter must be setted")
    }
    
}
