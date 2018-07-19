//
//  HomeProductTableViewCell.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 13/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class HomeProductTableViewCell: UITableViewCell {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!

    // Dependencies

    override func awakeFromNib() {
        super.awakeFromNib()
        layout()
    }
    
    func configure(with product: ProductHome) {
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = product.priceText
        authorLabel.text = product.authorNickname
        if let imageURL = product.imageURL {
            productImageView.setImageWithURL(imageURL)
        }
    }

    private func layout() {
        backgroundColor = .clear
        roundedView.layer.cornerRadius = 3
        roundedView.clipsToBounds = true
    }
}
