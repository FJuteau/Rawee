//
//  HomeProductResponse.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 01/06/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

struct ProductHomeResponse: Codable {
//    let info: InfoProductHomeResponse
//    let pricing: PricingProductHomeResponse
    
    let id: String
    let banner: String
    let bookName: String
    let thumb: String
}
