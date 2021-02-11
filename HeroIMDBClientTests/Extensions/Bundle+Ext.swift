//
//  Bundle+Ext.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 30/01/21.
//

import Foundation

extension Bundle {
    
    /// Function that loads a json local file into Data
    ///
    /// - Parameter name: The name of the JSON file in the Bundle
    /// - Returns: Data encoded with UTF8
    func readLocalJSONFile(_ name: String) -> Data? {
        if let path = self.path(forResource: name, ofType: "json"),
           let jsonData = try? String(contentsOfFile: path).data(using: .utf8) {
            return jsonData
        }
        return nil
    }
}
