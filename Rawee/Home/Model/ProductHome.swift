//
//  Product.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 12/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class ProductHome {
    let identifier: String
    let title: String
    let thumbURL: URL?

    init(from productHomeResponse: ProductHomeResponse) {
        self.identifier = productHomeResponse.id
        self.title = productHomeResponse.bookName
        self.thumbURL = URL(string: productHomeResponse.thumb)
    }
}
