//
//  SettingsCoordinator.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 09/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit
import FirebaseUI

class SettingsCoordinator: Coordinator {

    let presenter: UINavigationController
    let viewController: SettingsTableViewController

    init() {
        self.viewController = SettingsTableViewController()
        self.presenter = UINavigationController(rootViewController: viewController)
        
        viewController.title = "Settings"
        viewController.delegate = self
    }
    
    func start() {

    }
}

extension SettingsCoordinator: SettingsTableViewControllerDelegate {
    func settingsTableViewControllerShouldNavigate(to navigation: SettingsViewModel.Navigation) {
        switch navigation {
        case .loginScreen:
            let authViewController = FUIAuth.defaultAuthUI()!.authViewController()
            viewController.present(authViewController, animated: true) {
                
            }
        }
    }
}
