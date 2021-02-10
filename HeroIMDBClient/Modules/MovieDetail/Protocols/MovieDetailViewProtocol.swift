//
//  MovieDetailViewProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 7/02/21.
//

import Foundation

public protocol MovieDetailViewProtocol: class {
    var presenter: MovieDetailPresenterProtocol? { get set }
    /// Function to add the data
    func addData()
    /// Function to register cells
    func registerCells(with viewModels: [TableViewCellViewModelProtocol])
}
