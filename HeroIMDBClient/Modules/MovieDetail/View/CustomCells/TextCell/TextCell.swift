//
//  TextCell.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import UIKit

class TextCell: HeroTableViewCell {
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    private var _viewModel: TextCellViewModel {
        get {
            viewModel as! TextCellViewModel
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
        
        titleLabel.text = _viewModel.cellTitle
        contentLabel.text = _viewModel.cellContent
        
        topConstraint.constant = CGFloat(_viewModel.topMargin ?? 0)
        bottomConstraint.constant = CGFloat(_viewModel.bottomMargin ?? 0)
        leadingConstraint.constant = CGFloat(_viewModel.leadingMargin ?? 0)
        trailingConstraint.constant = CGFloat(_viewModel.trailingMargin ?? 0)
    }
}
