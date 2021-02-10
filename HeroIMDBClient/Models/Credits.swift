//
//  Credits.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import Foundation

public struct Credits: Decodable {
    var id: Int
    var cast: [Person]
    var crew: [Person]
}
