//
//  MockURLProtocol+Factory.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

extension MockURLProtocol {
    
    static func returnLoadPopularMoviesSuccess() {
        Self.requestHandler = { request in
            let jsonData = Bundle(for: MockURLProtocol.self)
                .readLocalJSONFile("LoadPopularMoview_succed")
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            
            return(response, jsonData)
        }
    }
    
    static func returnLoadPopularMoviesNoResponseData() {
        Self.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
            
            return(response, nil)
        }
    }
    
    static func returnLoadPopularMoviesNoResponseDataErrorCode400() {
        Self.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!,
                                           statusCode: 400,
                                           httpVersion: nil,
                                           headerFields: nil)!
            
            return(response, nil)
        }
    }
}
