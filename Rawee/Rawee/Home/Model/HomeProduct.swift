//
//  Product.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 12/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class ProductHome {
    let identifier: Int
    let title: String
    let imageURL: URL?
    let description: String
    let priceText: String
    let authorNickname: String

    init(from productHomeResponse: ProductHomeResponse) {
        self.identifier = productHomeResponse.info.id
        self.title = productHomeResponse.info.title
        self.imageURL = URL(string: productHomeResponse.info.thumbnail)
        self.description = productHomeResponse.info.content
        self.priceText = productHomeResponse.pricing.amount
        self.authorNickname = "Nil"
    }
}
