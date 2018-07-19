 //
//  HomeViewController.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 09/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

 protocol HomeTableViewControllerDelegate: class {
    func didSelect(productId: Int)
 }

class HomeTableViewController: UITableViewController {

    let viewModel: HomeViewModel = HomeViewModel(repository: HomeRepository(webservices: HomeWebservices()))
    let dataSource: HomeTableViewDataSource = HomeTableViewDataSource()

    var delegate: HomeTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        
        bind(to: viewModel)

        tableView.register(HomeProductTableViewCell.nib, forCellReuseIdentifier: HomeProductTableViewCell.storyboardIdentifier)
        viewModel.viewDidLoad()
    }

    private func layout() {
        tableView.backgroundColor = .applicationBackground
        view.backgroundColor = .applicationBackground
        navigationController?.navigationBar.barTintColor = .raweeBackground
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.titleText]
        navigationController?.navigationBar.tintColor = .titleText
    }

    private func bind(to viewModel: HomeViewModel) {
        viewModel.products = { [weak self] products in
            self?.dataSource.products = products
            self?.tableView.reloadData()
        }
    }
}

extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfProduct(in: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeProductTableViewCell.storyboardIdentifier) as? HomeProductTableViewCell else { return UITableViewCell() }

        cell.configure(with: dataSource.product(at: indexPath))
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = dataSource.product(at: indexPath)
        delegate?.didSelect(productId: product.identifier)
    }
}
