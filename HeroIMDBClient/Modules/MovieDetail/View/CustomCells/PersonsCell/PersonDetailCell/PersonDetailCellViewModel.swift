//
//  PersonDetailCellViewModel.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import Foundation

class PersonDetailCellViewModel {
    
    static var reuseID: String = "PersonDetailCell"
    static var nibName: String = "PersonDetailCell"
    
    private let imageBaseURLString = "https://image.tmdb.org/t/p/"
    private let imageSizeString = "w300"
    
    private let person: Person
    
    var personName: String {
        person.name
    }
    
    public var imageURL: URL? {
        let imageURLString = imageBaseURLString + imageSizeString + (person.profile_path ?? "")
        return URL(string: imageURLString)
    }
    
    init(person: Person) {
        self.person = person
    }
}
