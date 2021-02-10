//
//  Person+Ext.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation
import HeroIMDBClient

extension Person {
    
    static func getMockCast(quantity: Int) -> [Person] {
        var persons = [Person]()
        for id in 0 ..< quantity {
            let person = Person(id: id,
                                movieid: 1,
                                name: "Name lastname_\(id)",
                                job: "",
                                profile_path: "")
            persons.append(person)
        }
        return persons
    }
    
    static func getMockCrew(quantity: Int, quantityDirectors: Int) -> [Person] {
        var persons = [Person]()
        for id in 0 ..< quantity {
            if id < quantityDirectors {
                let person = Person(id: id,
                                    movieid: 1,
                                    name: "Name lastname_\(id)",
                                    job: "Director",
                                    profile_path: "")
                persons.append(person)
            } else {
                let person = Person(id: id,
                                    movieid: 1,
                                    name: "Name lastname_\(id)",
                                    job: "",
                                    profile_path: "")
                persons.append(person)
            }
        }
        return persons
    }
}
