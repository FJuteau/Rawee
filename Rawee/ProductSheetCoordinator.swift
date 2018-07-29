//
//  ProductSheetCoordinator.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class ProductSheetCoordinator: Coordinator {

    let presenter: UIViewController
    let viewController: ProductSheetViewController

    init(presenter: UIViewController, product: ProductHome) {
        self.presenter = presenter
        self.viewController = ProductSheetViewController.instance(for: product)
    }

    func start() {
        presenter.navigationController?.pushViewController(viewController, animated: true)
    }
}
