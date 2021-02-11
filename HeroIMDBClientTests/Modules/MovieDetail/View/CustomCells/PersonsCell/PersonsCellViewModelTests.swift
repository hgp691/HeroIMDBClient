//
//  PersonsCellViewModelTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import XCTest
@testable import HeroIMDBClient

class PersonsCellViewModelTests: XCTestCase {
    
    var viewModel: PersonsCellViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        var crew = Person.getMockCast(quantity: 4)
        let lastPerson = Person(id: 50,
                                movieid: 50,
                                name: "name lastname",
                                job: "",
                                profile_path: "")
        crew.append(lastPerson)
        viewModel = PersonsCellViewModel(persons: crew, title: "Test")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_PersonsCellViewModel_numerOfItems() {
        XCTAssertEqual(viewModel.numerOfItems, 5, "The quantity must be the same")
    }
    
    func test_PersonsCellViewModel_personAtIndex() {
        // Given
        let person = viewModel.person(at: 4)
        // Then
        XCTAssertEqual(person.id, 50, "The id must be the same")
    }
    
    func test_PersonsCellViewModel_title() {
        XCTAssertEqual(viewModel.titleText, "Test", "The id must be the same")
    }
}
