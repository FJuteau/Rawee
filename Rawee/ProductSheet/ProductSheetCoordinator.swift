//
//  ProductSheetCoordinator.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class ProductSheetCoordinator: Coordinator {

    let productId: Int
    let presenter: UIViewController
    let viewController: ProductSheetViewController

    init(presenter: UIViewController, productId: Int) {
        self.presenter = presenter
        self.productId = productId
        self.viewController = ProductSheetViewController.instance
        viewController.prepare(withProductId: productId)
    }

    func start() {
        presenter.navigationController?.pushViewController(viewController, animated: true)
    }
}
