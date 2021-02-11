//
//  TableViewCellViewModel.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 7/02/21.
//

import Foundation

public protocol TableViewCellViewModelProtocol: class {
    /// The Reuse Id for the cell
    static var reuseID: String { get }
    /// The nibName of the Cell
    static var nibName: String { get }
}

extension TableViewCellViewModelProtocol {
    
    var reuseID: String {
        Self.reuseID
    }
    
    var nibName: String {
        Self.nibName
    }
}
