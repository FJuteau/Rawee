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
    
    weak var delegate: SettingsTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(SettingsTableViewCell.nib, forCellReuseIdentifier: SettingsTableViewCell.storyboardIdentifier)
        
        bind(to: viewModel)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.items[indexPath.row] {
        case .login(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.storyboardIdentifier, for: indexPath) as? SettingsTableViewCell else { fatalError() }
            cell.configure(with: model)
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectItem(at: indexPath.row)
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
    }
}
