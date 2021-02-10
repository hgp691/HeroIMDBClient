//
//  TextCellViewModel.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 9/02/21.
//

import Foundation

class TextCellViewModel: TableViewCellViewModelProtocol {
    
    static var reuseID: String = "TextCell"
    static var nibName: String = "TextCell"
    
    let cellTitle: String
    let cellContent: String
    
    var topMargin: Double?
    var bottomMargin: Double?
    var leadingMargin: Double?
    var trailingMargin: Double?
    
    init(cellTitle: String, cellContent: String) {
        self.cellTitle = cellTitle
        self.cellContent = cellContent
    }
}
