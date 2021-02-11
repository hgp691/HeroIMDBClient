//
//  PersonDetailCellViewModelTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import XCTest
@testable import HeroIMDBClient

class PersonDetailCellViewModelTests: XCTestCase {
    
    var viewModel: PersonDetailCellViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let person = Person(id: 1,
                            movieid: 1,
                            name: "Name Lastname",
                            job: "Developer",
                            profile_path: "profilePath")
        viewModel = PersonDetailCellViewModel(person: person)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func test_PersonDetailCellViewModel_personName() {
        XCTAssertEqual(viewModel.personName, "Name Lastname", "The name must be the same as the person name")
    }
    
    func test_PersonDetailCellViewModel_imageURL() {
        // Given
        let expectedURL = "https://image.tmdb.org/t/p/w300profilePath"
        // Then
        XCTAssertEqual(viewModel.imageURL?.absoluteString, expectedURL, "The name must be the same as the person name")
    }
}
