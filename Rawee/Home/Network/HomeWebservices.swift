//
//  HomeWebservices.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

protocol HomeWebservicesType {
    func getHome(success: @escaping ((HomeResponse) -> Void), failure: @escaping ((Error) -> Void))
}

class HomeWebservices: HomeWebservicesType {
    let query: Query = Query(method: .get, path: "v2/products", queryItems: nil, parameters: nil, securityKey: nil)

    func getHome(success: @escaping ((HomeResponse) -> Void), failure: @escaping ((Error) -> Void)) {
//        let webserviceParser = WebserviceParser<HomeResponse>()
//        webserviceParser.success = success
//        Network().request(query: query, parser: webserviceParser)
        let docRef = db.collection("products")
        docRef.getDocuments(completion: { querySnapshot, err in
            if let querySnapshot = querySnapshot {
                let data = querySnapshot.documents.map { return $0.data() }
                let homeResponse = HomeResponse(data: data)
                print(homeResponse)
                success(homeResponse)
            } else if let err = err {
                print("Error getting documents: \(err)")
                failure(err)
            }
        })
    }
}
