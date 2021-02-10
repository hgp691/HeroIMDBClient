//
//  PersonDetailCell.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import UIKit
import SDWebImage

class PersonDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var personName: UILabel!
    var viewModel: PersonDetailCellViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(with viewModel: PersonDetailCellViewModel) {
        self.viewModel = viewModel
        
        personName.text = viewModel.personName
        personImage.sd_setImage(with: viewModel.imageURL,
                                placeholderImage: UIImage(named: "Unknown"))
    }

}
