//
//  HomeTableViewDatasource.swift
//  TabBarCoordinator
//
//  Created by François Juteau on 13/05/2018.
//  Copyright © 2018 vente-privee. All rights reserved.
//

import UIKit

class HomeTableViewDataSource {

    var products: [ProductHome] = []

    func numberOfProduct(in section: Int) -> Int {
        return products.count
    }

    func product(at indexPath: IndexPath) -> ProductHome {
        return products[indexPath.row]
    }
}
