//
//  NetworkError.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation


public enum NetworkError: Error {
    case badURL
    case noResponse
    case noResponseData
    /// Handler for the IMDB Error
    case imdbError(IMDBError)
    /// Error on the URLSession or URLRequest objects
    case externalError(Error)
}

extension NetworkError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
            case .badURL:
                return "networkError.badURL".heroLocalizedString()
            case .noResponse:
                return "networkError.noResponse".heroLocalizedString()
            case .noResponseData:
                return "networkError.noResponseData".heroLocalizedString()
            case .imdbError(let error):
                return error.errors.reduce("") { $0 + "\n" + $1 }
            case .externalError(let error):
                return error.localizedDescription
        }
    }
}
