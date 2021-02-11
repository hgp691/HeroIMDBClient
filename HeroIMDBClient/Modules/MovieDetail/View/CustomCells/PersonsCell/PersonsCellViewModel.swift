//
//  PersonsCellViewModel.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import Foundation

class PersonsCellViewModel: TableViewCellViewModelProtocol {
    
    static var reuseID: String = "PersonsCell"
    static var nibName: String = "PersonsCell"
    
    private let persons: [Person]
    private let title: String
    
    var numerOfItems: Int {
        persons.count
    }
    
    func person(at index: Int) -> Person {
        persons[index]
    }
    
    var titleText: String {
        title
    }
    
    init(persons: [Person], title: String) {
        self.persons = persons
        self.title = title
    }
}
