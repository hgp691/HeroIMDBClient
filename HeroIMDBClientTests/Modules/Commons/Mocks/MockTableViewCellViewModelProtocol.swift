//
//  MockTableViewCellViewModelProtocol.swift
//  HeroIMDBClientTests
//
//  Created by Horacio Guzman on 10/02/21.
//

import Foundation
import HeroIMDBClient

class MockTableViewCellViewModel: TableViewCellViewModelProtocol {
    static var reuseID: String = "file"
    static var nibName: String = "file"
}
