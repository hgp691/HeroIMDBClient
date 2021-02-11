//
//  DataManagertests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 2/02/21.
//

import XCTest
@testable import HeroIMDBClient

class DataManagertests: XCTestCase {
    
    var dataManager: DataManager!
    var networkProvider: NetworkProvider!
    var storage: MovieStorage!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        networkProvider = NetworkProvider(urlSession: urlSession)
        storage = MovieStorage(HeroDataStore(.inMemory))
        dataManager = DataManager(networkProvider, storage)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        dataManager = nil
        networkProvider = nil
        storage = nil
    }

    func test_DataManagertests_loadPage_succed() {
        // Given
        MockURLProtocol.returnLoadPopularMoviesSuccess()
        let expectation = XCTestExpectation(description: "Datamanager expectation")
        // When
        dataManager.getAPage(page: 1, onSucced: { (movies) in
            // Then
            XCTAssertEqual(movies.count, 20, "There must be 20 movies")
            let moviesSaved = self.storage.retrieveAllMovies()
            XCTAssertEqual(moviesSaved.count, 20, "There must be 20 movies")
            expectation.fulfill()
        }, onError: nil)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_DataManagertests_loadPage_Error() {
        // Given
        MockURLProtocol.returnLoadPopularMoviesNoResponseData()
        let expectation = XCTestExpectation(description: "Datamanager expectation")
        // When
        dataManager.getAPage(page: 1, onSucced: nil) { (error) in
            // Then
            XCTAssertNotNil(error, "There must be an error")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_DataManagertests_loadPage_FromDatabase() {
        // Given
        MockURLProtocol.returnLoadPopularMoviesNoResponseData()
        let expectation = XCTestExpectation(description: "Datamanager expectation")
        let movie1 = Movie.getMockMovie(id: 1, page: 1)
        let movie2 = Movie.getMockMovie(id: 2, page: 1)
        storage.save(movie: movie1)
        storage.save(movie: movie2)
        // When
        dataManager.getAPage(page: 1, onSucced: { (movies) in
            // Then
            XCTAssertEqual(movies.count, 2, "There must be 2 movies")
            expectation.fulfill()
        }, onError: nil)

        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_DataManagertests_loadMovie_Succed_FromNetworking() {
        // Given
        MockURLProtocol.returnLoadMovieSucced()
        let expectedId = 464052
        let expectation = XCTestExpectation(description: "Datamanager expectation")
        // When
        dataManager.getAMovie(movieId: expectedId, onSucced: { (movie) in
            // Then
            XCTAssertNotNil(movie)
            XCTAssertEqual(movie.id, expectedId, "The id must be the same")
            expectation.fulfill()
        }, onError: nil)
        wait(for: [expectation], timeout: 10.0)
    }
}
