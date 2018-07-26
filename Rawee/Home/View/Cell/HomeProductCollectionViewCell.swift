//
//  HomeProductCollectionViewCell.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 13/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class HomeProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    // Dependencies

    override func awakeFromNib() {
        super.awakeFromNib()
        layout()
    }
    
    func configure(with product: ProductHome) {
        titleLabel.text = product.title
        if let imageURL = product.thumbURL {
            productImageView.setImageWithURL(imageURL)
        }
    }

    private func layout() {
        backgroundColor = .clear
        roundedView.layer.cornerRadius = 3
        roundedView.clipsToBounds = true
    }
}
