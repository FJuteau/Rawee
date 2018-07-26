//
//  ProductSheetWebservices.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

protocol ProductSheetWebservicesType {
    func getProduct(id: String, success: @escaping ((ProductSheetResponse) -> Void), failure: @escaping ((Error) -> Void))
}

class ProductSheetWebservices: ProductSheetWebservicesType {
    func query(for id: String) -> Query {
        return Query(method: .get, path: "v2/products/", queryItems: ["product": String(id)], parameters: nil, securityKey: nil)
    }

    func getProduct(id: String, success: @escaping ((ProductSheetResponse) -> Void), failure: @escaping ((Error) -> Void)) {
        let webserviceParser = WebserviceParser<ProductSheetResponse>()
        webserviceParser.success = success
        Network().request(query: query(for: id), parser: webserviceParser)
    }
}
