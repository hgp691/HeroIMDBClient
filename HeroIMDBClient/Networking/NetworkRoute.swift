//
//  NetworkRoute.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

public protocol NetworkRouteProtocol {
    /// Method to build the URL for calling in each Endpoint
    /// - Parameter domain: The domaing for the services
    func buildURL(with domain: String) -> URL?
}

/// Function to represent an Endpoint
public struct NetworkRoute {
    let parameters: [String: String]
    let endpoint: String
    
    /// Init with tue url parameters
    /// - Parameter parameters: The parameters that must be included in the URL
    public init(_ endpoint: String = String(), parameters: [String: String]) {
        self.endpoint = endpoint
        self.parameters = parameters
    }
}

extension NetworkRoute: NetworkRouteProtocol {
    
    public func buildURL(with domain: String) -> URL? {
        guard !parameters.isEmpty,
              !domain.isEmpty else {
            return URL(string: domain + endpoint)
        }
        
        let queryParameters = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        var urlComponents = URLComponents(string: domain + endpoint)
        urlComponents?.queryItems = queryParameters
        return urlComponents?.url
    }
}
