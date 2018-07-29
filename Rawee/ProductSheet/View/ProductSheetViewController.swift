//
//  ProductSheetViewController.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 04/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class ProductSheetViewController: UIViewController {

    static func instance(for product: ProductHome) -> ProductSheetViewController {
        let viewController = ProductSheetViewController(nibName: "ProductSheetViewController", bundle: nil)
        viewController.prepare(with: product)
        return viewController
    }

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!

    var viewModel: ProductSheetViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        bind(to: viewModel)
        viewModel.viewDidLoad()
    }

    func prepare(with product: ProductHome) {
        viewModel = ProductSheetViewModel(repository: ProductSheetRepository(webservices: ProductSheetWebservices()), product: product)
    }

    // MARK: Private

    private func bind(to viewModel: ProductSheetViewModel) {
        viewModel.titleText = { [weak self] titleText in
            self?.titleLabel.text = titleText
        }
        viewModel.imageURL = { [weak self] imageURL in
            self?.imageView.setImageWithURL(imageURL)
        }
        viewModel.descriptionText = { [weak self] descriptionText in
            self?.descriptionLabel.text = descriptionText
        }
//        viewModel.priceText = { [weak self] priceText in
//            self?.priceLabel.text = priceText
//        }
//        viewModel.purchaseButtonText = { [weak self] purchaseButtonText in
//            self?.purchaseButton.setTitle(purchaseButtonText, for: .normal)
//        }
    }

}
