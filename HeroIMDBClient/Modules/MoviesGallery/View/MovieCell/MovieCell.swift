//
//  MovieCell.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 3/02/21.
//

import UIKit
import SDWebImage

class MovieCell: UICollectionViewCell {
    
    var viewModel: MovieCellViewModel?
    @IBOutlet weak var imageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(with ViewModel: MovieCellViewModel) {
        self.viewModel = ViewModel
        imageView.sd_setImage(with: self.viewModel?.imageURL,
                              placeholderImage: UIImage())
    }

}
