//
//  HeroTableViewCell.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 7/02/21.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    
    var viewModel: TableViewCellViewModelProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with viewModel: TableViewCellViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    private func setupUI() {
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
    }
}
