//
//  MovieDetailViewController.swift
//  HeroIMDBClient
//
//  Created by Horacio Guzman on 7/02/21.
//

import UIKit

class MovieDetailViewController: HeroViewController,
                                 InstantiationProtocol,
                                 TableViewControllerProtocol,
                                 MovieDetailViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: MovieDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = presenter?.movieTitle
        configureTableView(with: self)
        presenter?.viewDidLoad()
    }

    func addData() {
        DispatchQueue.main.async {
            self.navigationItem.title = self.presenter?.movieTitle
            self.tableView.reloadData()
        }
    }
    
    func registerCells(with viewModels: [TableViewCellViewModelProtocol]) {
        
        viewModels.forEach { registerCellViewModel(viewModel: $0) }
    }
}

extension MovieDetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Cantidad ViewModels \(presenter?.viewmodelsCount ?? 0)")
        return presenter?.viewmodelsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModel = presenter?.getViewModel(at: indexPath.row),
              let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.reuseID) as? HeroTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: cellViewModel)
        return cell
    }
}
