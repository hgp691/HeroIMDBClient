//
//  MoviesGalleryViewController.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 3/02/21.
//

import UIKit

final class MoviesGalleryViewController: HeroViewController, InstantiationProtocol {
    
    enum Section {
        case main
    }
    
    enum Constants {
        enum CollectionView {
            static var ItemHeight: CGFloat {
                UIScreen.main.bounds.width / 2
            }
            static var Itemwidth: CGFloat {
                1 / 3
            }
            static let ItemHInset: CGFloat = 4
            static let ItemVInset: CGFloat = 4
            static let GroupHInset: CGFloat = 4
            static let GroupVInset: CGFloat = 4
        }
    }
    
    typealias DiffDataSource = UICollectionViewDiffableDataSource<Section, MovieCellViewModel>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, MovieCellViewModel>
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - Variables
    var presenter: MoviesGalleryPresenterProtocol?
    private var diffDataSource: DiffDataSource!
    private var dataSourceSnapshot = DataSourceSnapshot()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "moviesGallery.title".heroLocalizedString()
        setupCollectionView()
        presenter?.viewDidLoad()
    }
    
    /// Function to setup the CollectionView
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.collectionViewLayout = createLayout()
        let bundle = Bundle(for: MovieCellViewModel.self)
        let nib = UINib(nibName: MovieCellViewModel.nibName,
                        bundle: bundle)
        collectionView.register(nib, forCellWithReuseIdentifier: MovieCellViewModel.reuseIdentifier)
        diffDataSource = DiffDataSource(collectionView: collectionView,
                                        cellProvider: { (collection, indexPath, movieCellViewModel) -> UICollectionViewCell? in
                                            guard let cell = collection.dequeueReusableCell(withReuseIdentifier: MovieCellViewModel.reuseIdentifier, for: indexPath) as? MovieCell else {
                                                return UICollectionViewCell()
                                            }
                                            cell.configure(with: movieCellViewModel)
                                            return cell
                                        })
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(Constants.CollectionView.Itemwidth),
                heightDimension: .absolute(Constants.CollectionView.ItemHeight)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets.top = Constants.CollectionView.ItemVInset
            item.contentInsets.bottom = Constants.CollectionView.ItemVInset
            item.contentInsets.leading = Constants.CollectionView.ItemHInset
            item.contentInsets.trailing = Constants.CollectionView.ItemHInset
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(200.0)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [item])
            group.contentInsets.leading = Constants.CollectionView.GroupHInset
            group.contentInsets.trailing = Constants.CollectionView.GroupHInset
            
            let section = NSCollectionLayoutSection(group: group)
            return section
        }
    }
}

extension MoviesGalleryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        if indexPath.row == presenter?.lastCellIndex {
            presenter?.loadNextPage()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectMovie(at: indexPath.row)
    }
}

extension MoviesGalleryViewController: MoviesGalleryViewProtocol {
    
    func addData(movies: [MovieCellViewModel]) {
        if !movies.isEmpty {
            collectionView.backgroundView = nil
        }
        dataSourceSnapshot = DataSourceSnapshot()
        dataSourceSnapshot.appendSections([.main])
        dataSourceSnapshot.appendItems(movies)
        diffDataSource.apply(dataSourceSnapshot)
    }
    
    func showEmptyStatus() {
        DispatchQueue.main.async {
            let emptyView = CollectionEmptyView()
            emptyView.title.text = "moviesGallery.emptyView.description".heroLocalizedString()
            emptyView.buttonDidPressed = { [weak self] in
                self?.presenter?.loadNextPage()
            }
            self.collectionView.backgroundView = emptyView
        }
    }
}
