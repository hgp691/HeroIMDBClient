//
//  MoviesGalleryPresenterTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 6/02/21.
//

import XCTest
@testable import HeroIMDBClient

class MoviesGalleryPresenterTests: XCTestCase {
    
    var presenter: MoviesGalleryPresenter!
    var view: PresenterTestsViewMock!
    var interactor: PresenterTestsInteractorMock!
    var router: PresenterTestsRouterMock!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = MoviesGalleryPresenter()
        view = PresenterTestsViewMock()
        presenter.view = view
        interactor = PresenterTestsInteractorMock()
        presenter.interactor = interactor
        router = PresenterTestsRouterMock()
        presenter.router = router
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        view = nil
        presenter = nil
        interactor = nil
        router = nil
    }

    func test_MoviesGalleryPresenter_viewDidLoad_must_called_getPage1() {
        // When
        presenter.viewDidLoad()
        // Then
        XCTAssertEqual(interactor.didCalledGetMoviesPage, 1, "The ViewDidload method must load the ")
    }
    
    func test_MoviesGalleryPresenter_getPage1_andNext1() {
        // When
        presenter.viewDidLoad()
        // Then
        let firstNumber = interactor.didCalledGetMoviesPage
        presenter.didLoadPage(page: firstNumber!, movies: [])
        presenter.loadNextPage()
        let secondNumber = interactor.didCalledGetMoviesPage
        
        XCTAssertEqual(firstNumber, 1, "The ViewDidload method must load the 1")
        XCTAssertEqual(secondNumber, 1, "The ViewDidload method must load the 1")
    }
    
    func test_MoviesGalleryPresenter_pushMovie() {
        // Given
        let movie = Movie.getMockMovie(id: 2)
        presenter.didLoadPage(page: 1, movies: [movie])
        // When
        presenter.didSelectMovie(at: 0)
        // Then
        XCTAssertEqual(movie.id, router.pushWithMovie?.id, "The movie must be sent to Router")
    }
    
    func test_MoviesGalleryPresenter_indexDoesntexists() {
        // When
        presenter.didSelectMovie(at: 0)
        // Then
        XCTAssertNil(router.pushWithMovie, "The push has not happened")
    }
    
    func test_MoviesGalleryPresenter_lastCellIndex() {
        // Given
        let movie = Movie.getMockMovie(id: 2)
        // When
        presenter.didLoadPage(page: 1, movies: [movie])
        // Then
        XCTAssertEqual(presenter.lastCellIndex, 0, "There is only one index")
    }
    
    func test_MoviesGalleryPresenter_lastCellIndex0() {
        // Then
        XCTAssertEqual(presenter.lastCellIndex, 0, "There is only one index")
    }
    
    func test_MoviesGalleryPresenter_presentAlert() {
        // Given
        let movie = Movie.getMockMovie(id: 2)
        presenter.didLoadPage(page: 1, movies: [movie])
        // When
        presenter.didFailLoadingPage(page: 2, error: NetworkError.noResponseData)
        // Then
        XCTAssertTrue(router.didPresentAlert, "The alert must be presented")
    }
}
