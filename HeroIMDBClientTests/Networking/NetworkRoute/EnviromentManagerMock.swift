//
//  EnviromentManagerMock.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 31/01/21.
//

import Foundation
@testable import HeroIMDBClient

struct EnviromentManagerMock: EnviromentManagerProtocol {
    
    var IMDBApiKey: String?
    var language: String?
    
    init(_ IMDBApiKey: String?, _ language: String?) {
        self.IMDBApiKey = IMDBApiKey
        self.language = language
    }
}
