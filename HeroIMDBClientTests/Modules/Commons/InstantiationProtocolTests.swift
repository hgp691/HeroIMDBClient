//
//  InstantiationProtocolTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 3/02/21.
//

import XCTest
@testable import HeroIMDBClient

class InstantiationProtocolTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_InstantiationProtocol_mustBeLoadTheViewController() {
        // When
        let vc = MockInstantiationViewController.instantiate()
        // Then
        XCTAssertNotNil(vc, "The ViexController must be instantiated")
    }
    
    func test_InstantiationProtocol_mustBeLoadTheViewController_SameName() {
        // When
        let vc = MockInstantiation1ViewController.instantiate()
        // Then
        XCTAssertNotNil(vc, "The ViexController must be instantiated")
    }
    
    func test_InstantiationProtocol_mustBeNil_noStoryboard() {
        // When
        let vc = MockInstantiation2ViewController.instantiate()
        // Then
        XCTAssertNil(vc, "The ViexController must be instantiated")
    }
    
    func test_InstantiationProtocol_mustBeLoadTheViewController_StoryboardId() {
        // When
        let vc = MockInstantiation1ViewController.instantiate(storyboardId: "MockInstantiation3")
        // Then
        XCTAssertNotNil(vc, "The ViexController must be instantiated")
    }
    
    func test_InstantiationProtocol_mustBeNil_noVCinStoryboard() {
        // When
        let vc = MockInstantiation4ViewController.instantiate()
        // Then
        XCTAssertNil(vc, "The ViexController must be instantiated")
    }
}
