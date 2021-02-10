//
//  MovieDetailPresenter.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 7/02/21.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    weak var view: MovieDetailViewProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var router: MovieDetailRouterProtocol?
    
    enum Constants {
        static let leadingMargin: Double = 16.0
        static let trailingMargin: Double = 16.0
    }
    
    private var viewModels: [TableViewCellViewModelProtocol] = []
    
    var viewmodelsCount: Int {
        viewModels.count
    }
    
    func viewDidLoad() {
        interactor?.loadMovie()
    }
    
    func getViewModel(at index: Int) -> TableViewCellViewModelProtocol {
        viewModels[index]
    }
    
    var movieTitle: String {
        interactor?.movie.title ?? ""
    }
    
    private func buildSections() {
        guard let movie = interactor?.movie else {
            return
        }
        viewModels = []
        buildImage(movie)
        buildTitle(movie)
        buildCast(movie)
        buildDirector(movie)
        view?.registerCells(with: viewModels)
    }
    
    private func buildImage(_ movie: Movie) {
        let viewModel = ImageButtonCellViewModel(movie)
        viewModels.append(viewModel)
    }
    
    private func buildTitle(_ movie: Movie) {
        let title = "movieDetail.movieTitle.title".heroLocalizedString()
        let content = movie.overview
        let viewModel = TextCellViewModel(cellTitle: title, cellContent: content)
        viewModel.leadingMargin = Constants.leadingMargin
        viewModel.trailingMargin = Constants.trailingMargin
        viewModels.append(viewModel)
    }
    
    private func buildCast(_ movie: Movie) {
        guard let cast = movie.cast else {
            return
        }
        let title = "movieDetail.movieCast.title".heroLocalizedString()
        let viewModel = PersonsCellViewModel(persons: cast, title: title)
        
        viewModels.append(viewModel)
    }
    
    private func buildDirector(_ movie: Movie) {
        guard let crew = movie.crew else {
            return
        }
        let directors = crew.filter { $0.job == "Director" }
        guard !directors.isEmpty else {
            return
        }
        let title = (directors.count > 1)
            ? "movieDetail.movieDirectors.title"
            : "movieDetail.movieDirector.title"
        let viewModel = PersonsCellViewModel(persons: directors,
                                             title: title.heroLocalizedString())
        viewModels.append(viewModel)
    }
}

extension MovieDetailPresenter: MovieDetailOutputProtocol {
    
    func didLoadedMovie() {
        buildSections()
        view?.addData()
    }
    
    func didLoadedMovieFailed(error: Error) {
        
    }
}
