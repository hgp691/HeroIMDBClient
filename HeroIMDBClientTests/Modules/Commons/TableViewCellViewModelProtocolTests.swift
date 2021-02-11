//
//  TableViewCellViewModelProtocolTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import XCTest
@testable import HeroIMDBClient

class TableViewCellViewModelProtocolTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_TableViewCellViewModelProtocol_reuseID() {
        // Given
        let cell = MockTableViewCellViewModel()
        // Then
        XCTAssertEqual(MockTableViewCellViewModel.reuseID, cell.reuseID, "The reuseID must be the same")
    }
    
    func test_TableViewCellViewModelProtocol_nibName() {
        // Given
        let cell = MockTableViewCellViewModel()
        // Then
        XCTAssertEqual(MockTableViewCellViewModel.nibName, cell.nibName, "The nibName must be the same")
    }
}
