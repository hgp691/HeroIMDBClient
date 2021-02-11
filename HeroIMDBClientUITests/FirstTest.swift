//
//  FirstTest.swift
//  HeroIMDBClientUITests
//
//  Created by Horacio Guzman on 10/02/21.
//

import XCTest

class FirstTest: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launchArguments = ["isUITest"]

        NetworkingMock.buildRequestHandler(requestCase: .empty)
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }
    
    func test_firstTest() {
        
        XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
    }

}
