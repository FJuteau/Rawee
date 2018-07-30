//
//  SettingsTableViewController.swift
//  Rawee
//
//  Created by François Juteau on 28/07/2018.
//  Copyright © 2018 rawee. All rights reserved.
//

import UIKit

protocol SettingsTableViewControllerDelegate: class {
    func settingsTableViewControllerShouldNavigate(to navigation: SettingsViewModel.Navigation)
}

class SettingsTableViewController: UITableViewController {

    var viewModel: SettingsViewModel = SettingsViewModel()
    var dataSource: SettingsDataSource = SettingsDataSource()
    weak var delegate: SettingsTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SettingsTableViewCell.nib, forCellReuseIdentifier: SettingsTableViewCell.storyboardIdentifier)
        tableView.register(UserSettingsTableViewCell.nib, forCellReuseIdentifier: UserSettingsTableViewCell.storyboardIdentifier)
        
        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfItem(in: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource.items[indexPath.row] {
        case .login(let model),
             .disconnect(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.storyboardIdentifier, for: indexPath) as? SettingsTableViewCell else { fatalError() }
            cell.configure(with: model)
            
            return cell
        case .user(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserSettingsTableViewCell.storyboardIdentifier, for: indexPath) as? UserSettingsTableViewCell else { fatalError() }
            cell.configure(with: model)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectItem(dataSource.item(at: indexPath))
    }
    
    // MARK: - Navigation
    
    func navigateTo(_ navigation: SettingsViewModel.Navigation) {
        switch navigation {
        case .loginScreen:
            delegate?.settingsTableViewControllerShouldNavigate(to: navigation)
        }
    }
    
    // MARK: - ViewModel
    
    func bind(to viewModel: SettingsViewModel) {
        viewModel.navigateTo = { [unowned self] navigation in
            self.navigateTo(navigation)
        }
        viewModel.items = { [unowned self] items in
            self.dataSource.items = items
            self.tableView.reloadData()
        }
    }
}
