//
//  SettingsCoordinator.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 09/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class SettingsCoordinator: Coordinator {

    let viewController: SettingsViewController

    init() {
        viewController = SettingsViewController()
        viewController.title = "Settings"
        viewController.view.backgroundColor = .yellow
    }
    
    func start() {

    }
}
