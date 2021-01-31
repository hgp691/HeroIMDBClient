//
//  NetworkRouteTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 30/01/21.
//

import XCTest
@testable import HeroIMDBClient

class NetworkRouteTests: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_NetworkRoute_URL_mustBeNil_withEmptyDomain() {
        // Given
        let route = NetworkRoute(parameters: [String: String]())
        // When
        let url = route.buildURL(with: String())
        // Then
        XCTAssertNil(url, "The URL must be nil when a empty String is provided")
    }

    func test_NetworkRoute_URL_mustBeEqualToDomain_withEmptyDictionary() {
        // Given
        let expectedDomain = "http://test.com/"
        let route = NetworkRoute(parameters: [String: String]())
        // When
        let url = route.buildURL(with: expectedDomain)
        // Then
        XCTAssertEqual(url?.absoluteString, expectedDomain, "The domain has to be returned")
    }
    
    func test_NetworkRoute_URL_mustBeBuilded() {
        // Given
        let domain = "http://test.com"
        let key1 = "TestKey1"
        let key2 = "TestKey2"
        let value1 = "TestValue1"
        let value2 = "TestValue2"
        let dictionary = [
            key1: value1,
            key2: value2
        ]
        let expectedURLString1 = "\(domain)?\(key2)=\(value2)&\(key1)=\(value1)"
        let expectedURLString2 = "\(domain)?\(key1)=\(value1)&\(key2)=\(value2)"
        let route = NetworkRoute(parameters: dictionary)
        // When
        let url = route.buildURL(with: domain)
        // Then
        let isEqual = url?.absoluteString == expectedURLString1 || url?.absoluteString == expectedURLString2
        XCTAssertTrue(isEqual, "The url must be builded correctly")
    }
    
    func test_NetworkRoute_RouteForLoadPages() {
        // Given
        let IMDBApiKey = "api_key"
        let language = "language"
        let page = 1
        // When
        let enviromentManager = EnviromentManagerMock(IMDBApiKey, language)
        let route = NetworkRoute.getPopularMoviesPage(page, enviromentManager)
        // Then
        let urlString = route.buildURL(with: "test")?.absoluteString
        let containsIMDBApiKey = urlString!.contains("=\(IMDBApiKey)")
        let containsLanguage = urlString!.contains("=\(language)")
        let containsPage = urlString!.contains("=\(page)")
        XCTAssertTrue(containsIMDBApiKey && containsLanguage && containsPage, "The url must be builded")
    }
    
    func test_NetworkRoute_RouteForLoadPages_PageMustBe1OrGreater() {
        // Given
        let IMDBApiKey = "api_key"
        let language = "language"
        let page = -1
        // When
        let enviromentManager = EnviromentManagerMock(IMDBApiKey, language)
        let route = NetworkRoute.getPopularMoviesPage(page, enviromentManager)
        // Then
        XCTAssertEqual(route.parameters["page"], "\(1)", "The page always be grater than 0")
    }
    
    func test_NetworkRoute_RouteForLoadPages_TheParametersMustExists() {
        // Given
        let IMDBApiKey: String? = nil
        let language: String? = nil
        let page = 1
        // When
        let enviromentManager = EnviromentManagerMock(IMDBApiKey, language)
        let route = NetworkRoute.getPopularMoviesPage(page, enviromentManager)
        // Then
        let parameterIMDB = route.parameters["api_key"]
        let parameterLanguage = route.parameters["language"]
        XCTAssertNotNil(parameterIMDB, "The parameter can't be nil")
        XCTAssertNotNil(parameterLanguage, "The parameter can't be nil")
    }
}
