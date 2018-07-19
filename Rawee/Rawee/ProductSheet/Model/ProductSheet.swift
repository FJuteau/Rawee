//
//  ProductSheet.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class ProductSheet {
    let identifier: Int
    let title: String
    let imageURL: URL?
    let description: String
    let authorNickname: String
    let priceText: String

    init(from response: ProductProductSheetResponse) {
        self.identifier = response.info.id
        self.title = response.info.title
        self.imageURL = URL(string: response.info.thumbnail)
        self.description = response.info.content
        self.priceText = response.pricing.amount
        self.authorNickname = "Nil"

    }
}
