//
//  PersonsCell.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import UIKit

class PersonsCell: HeroTableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var _viewModel: PersonsCellViewModel {
        get {
            viewModel as! PersonsCellViewModel
        }
    }
    
    enum Constants {
        enum CollectionView {
            static var ItemHeight: CGFloat {
                100.0
            }
            static var ItemWidth: CGFloat {
                60.0
            }
            static let ItemHInset: CGFloat = 4
            static let ItemVInset: CGFloat = 4
            static let GroupHInset: CGFloat = 4
            static let GroupVInset: CGFloat = 4
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setup(with viewModel: TableViewCellViewModelProtocol) {
        self.viewModel = viewModel
        collectionView.collectionViewLayout = createLayout()
        let bundle = Bundle(for: PersonDetailCellViewModel.self)
        let nib = UINib(nibName: PersonDetailCellViewModel.nibName, bundle: bundle)
        collectionView.register(nib,
                                forCellWithReuseIdentifier: PersonDetailCellViewModel.reuseID)
        collectionView.dataSource = self
        title.text = _viewModel.titleText
    }
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        
        return UICollectionViewCompositionalLayout { (sectionNumber, env) in
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .absolute(Constants.CollectionView.ItemWidth),
                heightDimension: .absolute(Constants.CollectionView.ItemHeight)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets.top = Constants.CollectionView.ItemVInset
            item.contentInsets.bottom = Constants.CollectionView.ItemVInset
            item.contentInsets.leading = Constants.CollectionView.ItemHInset
            item.contentInsets.trailing = Constants.CollectionView.ItemHInset
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(100.0)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                           subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
    }
}

extension PersonsCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        _viewModel.numerOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseID = PersonDetailCellViewModel.reuseID
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID,
                                                            for: indexPath) as? PersonDetailCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(with: PersonDetailCellViewModel(person: _viewModel.person(at: indexPath.row)))
        return cell
    }
}
