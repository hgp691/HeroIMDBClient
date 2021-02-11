//
//  MoviesGalleryViewControllerTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 7/02/21.
//

import XCTest
@testable import HeroIMDBClient

class MoviesGalleryViewControllerTests: XCTestCase {
    
    var viewController: MoviesGalleryViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = MoviesGalleryViewController.instantiate()
        viewController.viewDidLoad()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
    }
    
    func test_MoviesGalleryViewController_createLayout() {
        let layout = viewController.createLayout()
        XCTAssertEqual(layout.configuration.scrollDirection, .vertical, "The scroll must be vertical") 
    }

}
