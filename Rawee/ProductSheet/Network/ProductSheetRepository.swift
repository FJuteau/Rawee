//
//  ProductSheetRepository.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

protocol ProductSheetRepositoryType {
    func getProductSheet(from productId: String, success: @escaping ((ProductSheet) -> Void), failure: @escaping ((Error) -> Void))
}

class ProductSheetRepository: ProductSheetRepositoryType {

    // MARK: Dependencies
    let webservices: ProductSheetWebservices

    init(webservices: ProductSheetWebservices) {
        self.webservices = webservices
    }

    func getProductSheet(from productId: String, success: @escaping ((ProductSheet) -> Void), failure: @escaping ((Error) -> Void)) {
        webservices.getProduct(id: productId, success: { response in
            success(ProductSheetParser.productSheet(from: response))
        }) { error in
            failure(error)
        }
    }

}
