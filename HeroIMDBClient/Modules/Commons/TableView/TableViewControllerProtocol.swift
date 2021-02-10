//
//  TableViewControllerProtocol.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 7/02/21.
//

import UIKit

/// Protocol that can be conformed for inherit behavior of
protocol TableViewControllerProtocol where Self: UIViewController {
    
    /// The tableView that has to be present
    var tableView: UITableView! { get set }
}

extension TableViewControllerProtocol {
    
    func registerCellViewModel(viewModel: TableViewCellViewModelProtocol) {
        DispatchQueue.main.async {
            let bundle = Bundle(for: type(of: viewModel))
            let nib = UINib(nibName: viewModel.nibName, bundle: bundle)
            self.tableView.register(nib, forCellReuseIdentifier: viewModel.reuseID)
        }
    }
    
    func configureTableView(with datasource: UITableViewDataSource) {
        tableView.backgroundColor = .clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.dataSource = datasource
    }
}
