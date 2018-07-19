//
//  Home.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 12/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import Foundation

class Home {
    let products: [ProductHome]

    init(from homeResponse: HomeResponse) {
        self.products = homeResponse.products.map { return ProductHome(from: $0) }
    }
}
