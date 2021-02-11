//
//  EnviromentManager.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

public protocol EnviromentManagerProtocol {
    /// Key for the IMDB service
    var IMDBApiKey: String? { get }
    /// Current Language of the app
    var language: String? { get }
}

public struct EnviromentManager: EnviromentManagerProtocol {
    
    private struct Keys {
        static let api_key = "IMDB_API_KEY"
    }
    
    public var IMDBApiKey: String? {
        return ProcessInfo.processInfo.environment[EnviromentManager.Keys.api_key]
    }
    
    public var language: String? {
        return Locale.current.languageCode
    }
    
    public init() { }
}
