//
//  MovieStorageTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 31/01/21.
//

import XCTest
@testable import HeroIMDBClient

class MovieStorageTests: XCTestCase {
    
    var movieStorage: MovieStorage!
    var dataStore: HeroDataStore!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataStore = HeroDataStore(.inMemory)
        movieStorage = MovieStorage(dataStore)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieStorage = nil
        dataStore = nil
    }
    
    func test_MovieStorage_saveMovie() {
        // Given
        let movie = Movie.getMockMovie(id: 1)
        let page = MoviePage(page: 1, results: [movie], total_pages: 1, total_results: 1)
        // When
        movieStorage.save(moviePage: page)
        // Then
        XCTAssertEqual(movieStorage.movieCount(), 1, "The count must be 1")
    }
    
    func test_MovieStorage_retrieveMovieID() {
        // Given
        let id = 1
        let movie = Movie.getMockMovie(id: id)
        let page = MoviePage(page: 1, results: [movie], total_pages: 1, total_results: 1)
        movieStorage.save(moviePage: page)
        XCTAssertEqual(movieStorage.movieCount(), 1, "The count must be 1")
        // When
        let movieRetrieved = movieStorage.retrieve(movie: id)
        XCTAssertNotNil(movieRetrieved, "The movie must be retrieved")
    }

    func test_MovieStorage_retrieveAll() {
        // Given
        let movie1 = Movie.getMockMovie(id: 1)
        let movie2 = Movie.getMockMovie(id: 2)
        let page = MoviePage(page: 1,
                             results: [movie1, movie2],
                             total_pages: 1,
                             total_results: 1)
        movieStorage.save(moviePage: page)
        XCTAssertEqual(movieStorage.movieCount(), page.results.count, "The count must be matched")
        // When
        let moviesFetched = movieStorage.retrieveAllMovies()
        // Then
        XCTAssertEqual(moviesFetched.count, page.results.count, "The count must be the same")
    }
    
    func test_MovieStorage_retrieveAllMoviesOfPage() {
        // Given
        let movie1 = Movie.getMockMovie(id: 1, page: 1)
        let movie2 = Movie.getMockMovie(id: 2, page: 1)
        let movie3 = Movie.getMockMovie(id: 3, page: 2)
        movieStorage.save(movie: movie1)
        movieStorage.save(movie: movie2)
        movieStorage.save(movie: movie3)
        // When
        let moviesPage1 = movieStorage.retrieveAllMovies(1)
        let moviesPage2 = movieStorage.retrieveAllMovies(2)
        // Then
        XCTAssertEqual(moviesPage1.count, 2, "There must be three movies on the page 1")
        XCTAssertEqual(moviesPage2.count, 1, "There must be one movie on the page 2")
    }
    
    func test_MovieStorage_updateNotSave() {
        // Given
        let expectedTitle = "Title Updated"
        let idOfMovie = 1
        let movie1 = Movie.getMockMovie(id: idOfMovie)
        let page1 = MoviePage(page: 1,
                             results: [movie1],
                             total_pages: 1,
                             total_results: 1)
        movieStorage.save(moviePage: page1)
        // When
        var movie2 = Movie.getMockMovie(id: 1)
        movie2.title = expectedTitle
        let page2 = MoviePage(page: 1,
                             results: [movie2],
                             total_pages: 1,
                             total_results: 1)
        movieStorage.save(moviePage: page2)
        // Then
        XCTAssertEqual(movieStorage.movieCount(), 1, "The count must be 1")
        let movieFetched = movieStorage.retrieve(movie: 1)
        XCTAssertEqual(movieFetched?.title, expectedTitle, "The title must be updated")
    }
}
