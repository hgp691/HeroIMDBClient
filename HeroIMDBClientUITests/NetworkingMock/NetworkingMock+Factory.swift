//
//  NetworkingMock+Factory.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation

enum NetworkingMockCase: String {
    case success
    case empty
    case loadMovie
}

extension NetworkingMock {
    
    static func buildRequestHandler(requestCase: NetworkingMockCase) {
        Self.requestHandler = { request in
            guard let urlString = request.url?.absoluteString else {
                fatalError()
            }
            switch requestCase {
                case .success:
                    return Self.success(urlString: urlString)
                case .empty:
                    return Self.empty(urlString: urlString)
                case .loadMovie:
                    return loadMovie(urlString: urlString)
            }
        }
    }
    
    fileprivate static func success(urlString: String) -> (HTTPURLResponse, Data?) {
        let jsonData = Bundle(for: NetworkingMock.self)
            .readLocalJSONFile("loadMoviesSuccess")
        let response = HTTPURLResponse(url: URL(string: urlString)!,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)!
        return(response, jsonData)
    }
    
    fileprivate static func empty(urlString: String) -> (HTTPURLResponse, Data?) {
        let jsonData = Bundle(for: NetworkingMock.self)
            .readLocalJSONFile("loadMoviesSuccessEmpty")
        let response = HTTPURLResponse(url: URL(string: urlString)!,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)!
        return(response, jsonData)
    }
    
    fileprivate static func loadMovie(urlString: String) -> (HTTPURLResponse, Data?) {
        let jsonFileName: String
        if urlString.contains("credits") {
            jsonFileName = "loadCredits"
        } else {
            jsonFileName = "loadMovie"
        }
        let jsonData = Bundle(for: NetworkingMock.self)
            .readLocalJSONFile(jsonFileName)
        let response = HTTPURLResponse(url: URL(string: urlString)!,
                                       statusCode: 200,
                                       httpVersion: nil,
                                       headerFields: nil)!
        return(response, jsonData)
    }
    
    static func getURLSession() -> URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [NetworkingMock.self]
        let urlSession = URLSession(configuration: configuration)
        return urlSession
    }
}
