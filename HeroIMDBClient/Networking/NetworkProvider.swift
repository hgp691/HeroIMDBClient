//
//  NetworkProvider.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

public protocol NetworkProviderProtocol {
    var domain: String { get }
    func requestGET<T: Decodable>(_ route: NetworkRoute,
                                  _ completion: @escaping (Result<T, NetworkError>) -> Void)
}

public struct NetworkProvider: NetworkProviderProtocol {
    
    public let domain: String = "https://api.themoviedb.org/3/"
    let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func requestGET<T: Decodable>(_ route: NetworkRoute,
                                         _ completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = route.buildURL(with: domain) else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        let request = URLRequest(url: url)
        
        urlSession.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.noResponse))
                return
            }
            
            switch httpResponse.statusCode {
            
                case 200 ... 299:
                    guard let data = data else {
                        completion(.failure(NetworkError.noResponseData))
                        return
                    }
                    do {
                        let object = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(object))
                    } catch {
                        completion(.failure(NetworkError.externalError(error)))
                    }
                default:
                    if let error = error {
                        completion(.failure(NetworkError.externalError(error)))
                        return
                    }
                    guard let data = data else {
                        completion(.failure(NetworkError.noResponseData))
                        return
                    }
                    do {
                        let errorObject = try JSONDecoder().decode(IMDBError.self, from: data)
                        completion(.failure(NetworkError.imdbError(errorObject)))
                    } catch {
                        completion(.failure(NetworkError.externalError(error)))
                    }
            }
        }
        .resume()
    }
}
