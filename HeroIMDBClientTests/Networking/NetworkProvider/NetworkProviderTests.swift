//
//  NetworkProvider.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 30/01/21.
//

import XCTest
@testable import HeroIMDBClient

class NetworkProviderTests: XCTestCase {
    
    var networkProvider: NetworkProvider!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: configuration)
        networkProvider = NetworkProvider(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        networkProvider = nil
    }

    func test_NetworkProvider_completionError_WithURLError() {
        // Given
        let route = NetworkRoute("  ", parameters: [:])
        let expectation = XCTestExpectation(description: "Expectation for NetworkProvider")
        MockURLProtocol.returnLoadPopularMoviesSuccess()
        // When
        networkProvider.requestGET(route) { (result: Result<[String: String], NetworkError>) in
            switch result {
                case .failure(let error):
                    // Then
                    XCTAssertEqual(error.errorDescription, NetworkError.badURL.errorDescription)
                    expectation.fulfill()
                default:
                    break
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func test_NetworkProvider_completionSucced() {
        // Given
        let route = NetworkRoute.getPopularMoviesPage(1)
        MockURLProtocol.returnLoadPopularMoviesSuccess()
        let expectation = XCTestExpectation(description: "Expectation for NetworkProvider")
        // When
        networkProvider.requestGET(route) { (result: Result<MoviePage, NetworkError>) in
            switch result {
                case .success(let moviePage):
                    // Then
                    XCTAssertNotNil(moviePage, "There must exists the moviePage")
                    expectation.fulfill()
                default:
                    break
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_NetworkProvider_completion_Error_decoding() {
        // Given
        let route = NetworkRoute.getPopularMoviesPage(1)
        MockURLProtocol.returnLoadPopularMoviesNoResponseData()
        let expectation = XCTestExpectation(description: "Expectation for NetworkProvider")
        // When
        networkProvider.requestGET(route) { (result: Result<MoviePage, NetworkError>) in
            switch result {
                case .failure(let error):
                    XCTAssertNotNil(error, "There must be an Error")
                    expectation.fulfill()
                default:
                    break
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_NetworkProvider_completion_ErrorCode400() {
        // Given
        let route = NetworkRoute.getPopularMoviesPage(1)
        MockURLProtocol.returnLoadPopularMoviesNoResponseDataErrorCode400()
        let expectation = XCTestExpectation(description: "Expectation for NetworkProvider")
        // When
        networkProvider.requestGET(route) { (result: Result<MoviePage, NetworkError>) in
            switch result {
                case .failure(let error):
                    XCTAssertNotNil(error, "There must be an Error")
                    expectation.fulfill()
                default:
                    break
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
