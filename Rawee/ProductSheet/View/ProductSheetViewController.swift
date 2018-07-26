//
//  ProductSheetViewController.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 04/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class ProductSheetViewController: UIViewController {

    static var instance: ProductSheetViewController {
        return ProductSheetViewController(nibName: "ProductSheetViewController", bundle: nil)
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

    func prepare(withProductId productId: String) {
        viewModel = ProductSheetViewModel(repository: ProductSheetRepository(webservices: ProductSheetWebservices()), productId: productId)
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
        viewModel.priceText = { [weak self] priceText in
            self?.priceLabel.text = priceText
        }
        viewModel.purchaseButtonText = { [weak self] purchaseButtonText in
            self?.purchaseButton.setTitle(purchaseButtonText, for: .normal)
        }
    }

}
