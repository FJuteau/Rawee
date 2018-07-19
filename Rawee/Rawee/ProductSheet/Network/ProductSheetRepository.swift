//
//  ProductSheetRepository.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

protocol ProductSheetRepositoryType {
    func getProductSheet(from productId: Int, success: @escaping ((ProductSheet) -> Void), failure: @escaping ((Error) -> Void))
}

class ProductSheetRepository: ProductSheetRepositoryType {

    // MARK: Dependencies
    let webservices: ProductSheetWebservices

    init(webservices: ProductSheetWebservices) {
        self.webservices = webservices
    }

    func getProductSheet(from productId: Int, success: @escaping ((ProductSheet) -> Void), failure: @escaping ((Error) -> Void)) {
        webservices.getProduct(id: productId, success: { response in
            success(ProductSheetParser.productSheet(from: response))
        }) { error in
            failure(error)
        }
    }

}
//class MockProductSheetRepository: ProductSheetRepositoryType {
//    func getProductSheet(from productId: Int, success: ((ProductSheet) -> Void), failure: ((Error) -> Void)) {
//        switch productId {
//        case 1:
//            success(ProductSheet(title: "First sale", imageURL: URL(string:"http://mvp.rawee.online/wp-content/uploads/2018/02/0-02-08-81c748d383bb7f25ce6a4a1186e6e08cb867f89deed587ab8b5101dba4d720c6_full-600x450.jpg"), description: "First sale description", authorNickname: "Norah", priceText: "$ 20.00"))
//        case 2:
//            success(ProductSheet(title: "Second sale", imageURL: URL(string:"http://mvp.rawee.online/wp-content/uploads/2018/02/0-02-08-81c748d383bb7f25ce6a4a1186e6e08cb867f89deed587ab8b5101dba4d720c6_full-600x450.jpg"), description: "Second sale description", authorNickname: "Norah", priceText: "$ 20.00"))
//        case 3:
//            success(ProductSheet(title: "Third sale", imageURL: URL(string:"http://mvp.rawee.online/wp-content/uploads/2018/02/0-02-08-81c748d383bb7f25ce6a4a1186e6e08cb867f89deed587ab8b5101dba4d720c6_full-600x450.jpg"), description: "Third sale description", authorNickname: "Norah", priceText: "$ 20.00"))
//        case 4:
//            success(ProductSheet(title: "Fourth sale", imageURL: URL(string:"http://mvp.rawee.online/wp-content/uploads/2018/02/0-02-08-81c748d383bb7f25ce6a4a1186e6e08cb867f89deed587ab8b5101dba4d720c6_full-600x450.jpg"), description: "Fourth sale description", authorNickname: "Norah", priceText: "$ 20.00"))
//        default:
//            failure(RepositoryError())
//        }
//
//    }
//}
