//
//  ProductSheetParser.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 25/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class ProductSheetParser {
    class func productSheet(from response: ProductSheetResponse) -> ProductSheet {
        guard let product = response.products.first else { fatalError() }

        return ProductSheet(from: product)
    }
}
