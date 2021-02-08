//
//  CollectionEmptyViewTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 7/02/21.
//

import XCTest
@testable import HeroIMDBClient

class CollectionEmptyViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_CollectionEmptyView_buttonDidPressed() {
        let expectation = XCTestExpectation(description: "expectation for CollectionEmptyView")
        let view = CollectionEmptyView()
        view.buttonDidPressed = {
            XCTAssertTrue(true, "You must execute this code")
            expectation.fulfill()
        }
        view.buttonPressed(view.button)
        wait(for: [expectation], timeout: 10.0)
    }
    
    func test_CollectionEmptyView() {
        let vc = CollectionEmptyViewViewController.instantiate()
        XCTAssertTrue(vc?.view.subviews.first is CollectionEmptyView, "There must be a CollectionEmptyView")
    }

}
