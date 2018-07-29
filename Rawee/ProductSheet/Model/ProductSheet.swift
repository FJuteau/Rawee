//
//  ProductSheet.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class ProductSheet {
    let identifier: String
    let title: String
    let imageURL: URL?
    let description: String

    init(from response: ProductSheetResponse) {
        self.identifier = response.id
        self.title = response.bookName
        self.imageURL = URL(string: response.banner)
        self.description = response.bookDesc
    }
}
