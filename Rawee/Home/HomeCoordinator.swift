//
//  HomeCoordinator.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 09/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {

    let presenter: UINavigationController
    let viewController: HomeTableViewController

    var productSheetCoordinator: ProductSheetCoordinator?

    init() {
        self.viewController = HomeTableViewController()
        self.presenter = UINavigationController(rootViewController: viewController)

        viewController.title = "Home"
        viewController.delegate = self
    }

    func start() {

    }
}

extension HomeCoordinator: HomeTableViewControllerDelegate {
    func didSelect(productId: Int) {
        let productSheetCoordinator = ProductSheetCoordinator(presenter: viewController, productId: productId)
        productSheetCoordinator.start()

        self.productSheetCoordinator = productSheetCoordinator
    }
}
