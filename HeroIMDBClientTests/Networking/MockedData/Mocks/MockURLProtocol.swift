//
//  MockURLProtocol.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

/// Class that implements URLProtocol in order to mock the responses and test the different states
class MockURLProtocol: URLProtocol {
    
    /// Closure that must be passed to the MockURLProtocol to mock every response when ever is needed
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data?))?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        
        return request
    }
    
    override func startLoading() {
        
        guard let handler = MockURLProtocol.requestHandler else {
            fatalError("Handler must be provided in order to make a test")
        }
        
        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            if let data = data {
                client?.urlProtocol(self, didLoad: data)
            }
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
        
    }
    
    override func stopLoading() {
        
    }
}
