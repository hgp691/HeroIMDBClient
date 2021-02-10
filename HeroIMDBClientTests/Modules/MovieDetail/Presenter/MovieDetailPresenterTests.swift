//
//  MovieDetailPresenterTests.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import XCTest
@testable import HeroIMDBClient

class MovieDetailPresenterTests: XCTestCase {
    
    var presenter: MovieDetailPresenter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        presenter = MovieDetailPresenter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        presenter = nil
    }

    func test_MovieDetailPresenter_loadMovieDidCalled() {
        // Given
        let movie = Movie.getMockMovie(id: 1)
        let dataManager = MockMovieDetailDataManager(movie: movie, error: nil)
        let interactor = MockMovieDetailInteractor(dataManager: dataManager)
        presenter.interactor = interactor
        // When
        presenter.viewDidLoad()
        // Then
        XCTAssertTrue(interactor.didCalledLoadMovie, "The loadMovieShouldBeCalled")
        
    }
    
    func test_MovieDetailPresenter_titleMustBeEmpty() {
        // When
        presenter.interactor = nil
        // Then
        XCTAssertEqual(presenter.movieTitle, "", "The title must be empty")
    }
    
    func test_MovieDetailPresenter_viewModelsMustBeEmpty() {
        // When
        presenter.interactor = nil
        presenter.didLoadedMovie()
        // Then
        XCTAssertEqual(presenter.viewmodelsCount, 0, "The viewControllers must be empty")
    }
    
    func test_MovieDetailPresenter_theCastMustBeSetted() {
        // Given
        var movie = Movie.getMockMovie(id: 1)
        let cast = Person.getMockCast(quantity: 3)
        movie.cast = cast
        let dataManager = MockMovieDetailDataManager(movie: movie, error: nil)
        let interactor = MockMovieDetailInteractor(dataManager: dataManager)
        interactor.movie = movie
        presenter.interactor = interactor
        // When
        presenter.didLoadedMovie()
        // Then
        let castViewModel = presenter.getViewModel(at: 2)
        let isCast = castViewModel is PersonsCellViewModel
        XCTAssertTrue(isCast, "The cast Must Be setted")
    }
    
    func test_MovieDetailPresenter_theDirectorsMustBeSetted() {
        // Given
        var movie = Movie.getMockMovie(id: 1)
        let crew = Person.getMockCrew(quantity: 2, quantityDirectors: 1)
        movie.crew = crew
        let dataManager = MockMovieDetailDataManager(movie: movie, error: nil)
        let interactor = MockMovieDetailInteractor(dataManager: dataManager)
        interactor.movie = movie
        presenter.interactor = interactor
        // When
        presenter.didLoadedMovie()
        // Then
        let castViewModel = presenter.getViewModel(at: 2)
        let isCast = castViewModel is PersonsCellViewModel
        XCTAssertTrue(isCast, "The directors Must Be setted")
    }
}
