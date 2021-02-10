//
//  MainCoordinatorTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import XCTest
@testable import HeroIMDBClient

class MainCoordinatorTests: XCTestCase {
    
    var coordinator: MainCoordinator!
    var navigationController: UINavigationController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        navigationController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navigationController)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        navigationController = nil
        coordinator = nil
    }

    func test_MainCoordinator_rootViewController() {
        // When
        coordinator.showMoviesGallery(isRoot: true)
        coordinator.showMoviesGallery(isRoot: true)
        // Then
        let totalViewController = navigationController.viewControllers.count
        XCTAssertEqual(totalViewController, 1, "Only must be one when you called the isRoot true")
    }
    
    func test_MainCoordinator_pushViewController() {
        // Given
        let movie = Movie.getMockMovie(id: 1)
        // When
        coordinator.showMoviesGallery(isRoot: true)
        coordinator.showMovieDetail(isRoot: false, movie: movie)
        // Then
        let totalViewController = navigationController.viewControllers.count
        XCTAssertEqual(totalViewController, 1, "Only must be one when you called the isRoot true")
    }
    
    func test_MainCoordinator_rootViewController_() {
        // Given
        let movie = Movie.getMockMovie(id: 1)
        // When
        coordinator.showMoviesGallery(isRoot: false)
        coordinator.showMovieDetail(isRoot: true, movie: movie)
        // Then
        let totalViewController = navigationController.viewControllers.count
        XCTAssertEqual(totalViewController, 1, "Only must be one when you called the isRoot true")
    }
}
