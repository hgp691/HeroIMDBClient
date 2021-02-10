//
//  ImageButtonCell.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import UIKit
import SDWebImage

class ImageButtonCell: HeroTableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    private var _viewModel: ImageButtonCellViewModel {
        get {
            return viewModel as! ImageButtonCellViewModel
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func setup(with viewModel: TableViewCellViewModelProtocol) {
        self.viewModel = viewModel
        
        posterImageView.sd_setImage(with: _viewModel.imageURL,
                                    placeholderImage: UIImage())
        if !_viewModel.shouldShowButton {
            bottomConstraint.constant = 0
            buttonContainer.isHidden = true
        }
    }
}
