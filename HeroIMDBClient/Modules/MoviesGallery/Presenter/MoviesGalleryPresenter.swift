//
//  MoviesGalleryPresenter.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 3/02/21.
//

import Foundation

final class MoviesGalleryPresenter: MoviesGalleryPresenterProtocol {
    
    weak var view: MoviesGalleryViewProtocol?
    var interactor: MoviesGalleryInteractorProtocol?
    var router: MoviesGalleryRouterProtocol?
    
    var viewModels: [MovieCellViewModel] = []
    
    private var currentPage = 0
    private var isLoading = false
    
    var lastCellIndex: Int {
        let lastIndex = (viewModels.count > 0) ? viewModels.count - 1 : 0
        return lastIndex
    }
    
    func viewDidLoad() {
        if !isLoading {
            isLoading = true
            interactor?.getMoviesPage(page: currentPage + 1)
        }
    }
    
    func loadNextPage() {
        if !isLoading {
            isLoading = true
            interactor?.getMoviesPage(page: currentPage + 1)
        }
    }
    
    func didSelectMovie(at index: Int) {
        guard viewModels.indices.contains(index) else {
            return
        }
        let movie = viewModels[index].movie
        router?.pushDetailModule(with: movie)
    }
}

extension MoviesGalleryPresenter: MoviesGalleryOutputProtocol {
    
    func didLoadPage(page: Int, movies: [Movie]) {
        guard !movies.isEmpty else {
            isLoading = false
            return
        }
        viewModels.append(contentsOf: movies.map { MovieCellViewModel($0) })
        view?.addData(movies: viewModels)
        currentPage = page
        isLoading = false
    }
    
    func didFailLoadingPage(page: Int, error: Error) {
        isLoading = false
        if viewModels.isEmpty {
            view?.showEmptyStatus()
        } else {
            router?.presentAlert(message: error.localizedDescription,
                                 completion: nil)
        }
    }
}
