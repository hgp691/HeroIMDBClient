//
//  MovieDetailRouterProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 7/02/21.
//

import UIKit

public protocol MovieDetailRouterProtocol: class {
    /// Coordinator to handle Navigation
    var coordinator: CoordinatorProtocol? { get set }
    /// Function used to build the current module
    static func buildModule(_ movie: Movie,_ coordinator: CoordinatorProtocol?) -> UIViewController
}
