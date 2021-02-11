//
//  NetworkErrorTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 30/01/21.
//

import XCTest
@testable import HeroIMDBClient

class NetworkErrorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_NetworkError_BadURL() {
        // Given
        let error = NetworkError.badURL
        let expectedMessage = "networkError.badURL".heroLocalizedString()
        // When
        let description = error.errorDescription
        // Then
        XCTAssertEqual(description, expectedMessage, "The message must be the same")
    }
//    case badURL
//    case noResponse
//    case noResponseData
//    case imdbError(IMDBError)
//    case externalError(Error)
    
    func test_NetworkError_NoResponse() {
        // Given
        let error = NetworkError.noResponse
        let expectedMessage = "networkError.noResponse".heroLocalizedString()
        // When
        let description = error.errorDescription
        // Then
        XCTAssertEqual(description, expectedMessage, "The message must be the same")
    }
    
    func test_NetworkError_noResponseData() {
        // Given
        let error = NetworkError.noResponseData
        let expectedMessage = "networkError.noResponseData".heroLocalizedString()
        // When
        let description = error.errorDescription
        // Then
        XCTAssertEqual(description, expectedMessage, "The message must be the same")
    }
    
    func test_NetworkError_imdbError() {
        // Given
        let imdbError = IMDBError(errors: ["This is an error", "This is another error"])
        let error = NetworkError.imdbError(imdbError)
        let expectedMessage = "\nThis is an error\nThis is another error"
        // When
        let description = error.errorDescription
        // Then
        XCTAssertEqual(description, expectedMessage, "The message must be the same")
    }
    
    func test_NetworkError_externalError() {
        // Given
        let expectedMessage = "This is an expected message"
        let mockError = MockError.test(expectedMessage)
        let error = NetworkError.externalError(mockError)
        
        // When
        let description = error.errorDescription
        // Then
        XCTAssertEqual(description, expectedMessage, "The message must be the same")
    }
}
