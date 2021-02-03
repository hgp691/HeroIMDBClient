//
//  NetworkRoute+Factory.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

extension NetworkRoute {
    public struct Keys {
        static let apiKey = "api_key"
        static let language = "language"
        static let page = "page"
    }
    /// Factory method to retrieve a NetworkRoute for getting a movie's page
    /// - Parameter aca:
    public static func getPopularMoviesPage(_ page: Int,
                                            _ enviromentManager: EnviromentManagerProtocol = EnviromentManager()) -> NetworkRoute {
        let endpoint = "movie/popular"
        let pageToSearch = (page > 0) ? page : 1
        let params = [
            NetworkRoute.Keys.apiKey: enviromentManager.IMDBApiKey ?? "",
            NetworkRoute.Keys.language: enviromentManager.language ?? "",
            NetworkRoute.Keys.page: "\(pageToSearch)"
        ]
        
        return NetworkRoute(endpoint, parameters: params)
    }
    
    public static func getMovie(_ movieId: Int,
                                _ enviromentManager: EnviromentManagerProtocol = EnviromentManager()) -> NetworkRoute {
        let endpoint = "movie/\(movieId)"
        let params = [
            NetworkRoute.Keys.apiKey: enviromentManager.IMDBApiKey ?? "",
            NetworkRoute.Keys.language: enviromentManager.language ?? "",
        ]
        return NetworkRoute(endpoint, parameters: params)
    }
}
