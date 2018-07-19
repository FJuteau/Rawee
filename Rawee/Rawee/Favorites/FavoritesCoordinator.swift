//
//  FavoritesCoordinator.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 09/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class FavoritesCoordinator: Coordinator {

    let viewController: FavoritesViewController

    init() {
        viewController = FavoritesViewController()
        viewController.title = "Favorite"
        viewController.view.backgroundColor = .red
    }

    func start() {

    }
}
